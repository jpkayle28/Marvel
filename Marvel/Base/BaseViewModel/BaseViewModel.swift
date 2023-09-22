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
    lazy var responseObserver: Observation<Result<BaseResponse<DataContainer<ResponseObjectType>>, Error>> = Observation()
    
    // MARK: - Initializer
    init(_ loaderObserver: Observation<Bool>? = nil) {
        self.loaderObserver = loaderObserver
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
        responseObserver.value = .success(response)
    }
    
    // When the request fails, fire the error observer with the error returned
    func requestFailed(_ error: Error) {
        loaderObserver?.value = false
        responseObserver.value = .failure(error)
    }
    
    
}

extension BaseViewModel {
    
    var items: [ResponseObjectType]? {
        switch responseObserver.value {
            case .success(let response):
                return response.data?.results
            default:
                return []
        }
    }
    
}
