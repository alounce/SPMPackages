//
//  APIStubService.swift
//  Packages
//
//  Created by Oleksa on 1/18/22.
//

import Foundation
import Combine

class APIStubService: API {
    func load<T>(request: URLRequest) -> AnyPublisher<T, APIError> where T : Decodable {
        Future { promice in
            DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + 3) {
                guard let url = request.url else {
                    return promice(.failure(APIError.invalidLocalResource("from url")))
                }
                let resourceName = "\(url.lastPathComponent).json"
                
                guard let url = Bundle.main.url(forResource: resourceName, withExtension: "") else {
                    return promice(.failure(APIError.invalidLocalResource(resourceName)))
                }
                
                guard let raw = try? Data(contentsOf: url) else {
                    return promice(.failure(APIError.invalidLocalResourceContent(resourceName)))
                }
                
                var products = Products()
                do {
                    products = try JSONDecoder().decode(Products.self, from: raw)
                } catch {
                    return promice(.failure(APIError.invalidJSON(resourceName)))
                }
                
                print("###: Load Product Thread: \(Thread.current)")
                
                return promice(.success(products as! T))
            }
        }.eraseToAnyPublisher()
    }
}
