//
//  NetworkManager.swift
//  AlamofireApp
//
//  Created by Sergei Bakhmatov on 13.05.2023.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchFruits(from url: URL, completion: @escaping(Result<[Fruit], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataRespons in
                switch dataRespons.result {
                case .success(let value):
                    let fruits = Fruit.getFruits(from: value)
                    completion(.success(fruits))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        
    }
}
