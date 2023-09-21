//
//  Observation.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 21/09/2023.
//

import Foundation

class Observation<T> {
    
    typealias CompletionHandler = ((T?) -> Void)
    
    var value : T? {
        didSet {
            self.notify()
        }
    }
    
    var completionHandler: CompletionHandler?
    
    public func addObserver(_ completionHandler: @escaping CompletionHandler) {
        self.completionHandler = completionHandler
    }
    
    public func addAndNotify(_ completionHandler: @escaping CompletionHandler, value: T? = nil) {
        self.addObserver(completionHandler)
        self.value = value
    }
    
    private func notify() {
        completionHandler?(value)
    }
}

