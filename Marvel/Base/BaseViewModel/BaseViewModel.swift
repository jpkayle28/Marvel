//
//  BaseViewModel.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 21/09/2023.
//

import Foundation

class BaseViewModel<ResponseObjectType: Decodable>: NSObject {
    
    // MARK: Observers
    var loaderObserver: Observation<Bool>?
    var errorObserver: Observation<Error>?
    lazy var successObserver: Observation<BaseResponse<DataContainer<ResponseObjectType>>> = Observation()
    
    // MARK: - Initializer
    init(_ loaderObserver: Observation<Bool>? = nil, _ errorObserver: Observation<Error>? = nil) {
        self.loaderObserver = loaderObserver
        self.errorObserver = errorObserver
        super.init()
    }
    
    func sendRequest(_ endpoint: Constants.APIEndpoint) {
        Task {
            do {
                let result = try await NetworkClient.shared.sendRequest(endpoint, objectType: ResponseObjectType.self)
                requestSucceeded(result)
            } catch {
                requestFailed(error)
            }
        }
    }
    
    // When the request func is called, set the loader to show
    func request() {
        loaderObserver?.value = true
    }
    
    // When the request succeeds, fire the success observer with the response returned
    func requestSucceeded(_ response: BaseResponse<DataContainer<ResponseObjectType>>) {
        loaderObserver?.value = false
        successObserver.value = response
    }
    
    // When the request fails, fire the error observer with the error returned
    func requestFailed(_ error: Error) {
        loaderObserver?.value = false
        errorObserver?.value = error
    }
    
    
}

extension BaseViewModel {
    
    var items: [ResponseObjectType]? {
        return successObserver.value?.data?.results
    }
    
}
