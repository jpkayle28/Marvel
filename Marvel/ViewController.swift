//
//  ViewController.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 19/09/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = Model()
        Task {
            do {
                let result = try await api.fetchCharacters()
                print(result)
            } catch {
                print(error)
            }
        }
    }


}

