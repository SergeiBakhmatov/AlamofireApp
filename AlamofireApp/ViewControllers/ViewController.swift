//
//  ViewController.swift
//  AlamofireApp
//
//  Created by Sergei Bakhmatov on 13.05.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private var fruits: [Fruit] = []
    private let networkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFruits()
    }
    
    private func fetchFruits() {
        networkManager.fetchFruits(from: URL(string: "https://www.fruityvice.com/api/fruit/all")!) { [weak self] result in
            switch result {
            case .success(let fruits):
                self?.fruits = fruits
                print(fruits)
            case .failure(let error):
                print(error)
            }
        }
        
    }


}

