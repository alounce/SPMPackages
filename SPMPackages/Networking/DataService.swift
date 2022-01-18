//
//  DataService.swift
//  Packages
//
//  Created by Oleksa on 1/18/22.
//

import Foundation
import Combine
import Networking

protocol DataService {
    func loadProducts() -> AnyPublisher<Products, APIError>
}

struct DataServiceImpl: DataService {
    let api: API
    init(api: API = APIService()) {
        self.api = api
    }
    
    func loadProducts() -> AnyPublisher<Products, APIError> {
        let request = URLRequest(url: Endpoint.allProducts.url)
        return api.load(request: request)
    }
}
