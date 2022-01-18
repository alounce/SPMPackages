//
//  APIClientImpl.swift
//  Packages
//
//  Created by Oleksa on 1/18/22.
//

import Foundation
import Combine

public struct APIService: API {
    
    public init() {}
    
    public func load<T>(request: URLRequest) -> AnyPublisher<T, APIError> where T: Decodable {
        let decoder = JSONDecoder()
        // here we can configure custom decoder properties
        return URLSession
            .shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .invalidURL }
            .flatMap { data, response ->  AnyPublisher<T, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.generic).eraseToAnyPublisher()
                }
                guard (200...299).contains(response.statusCode) else {
                    print("### HTTP error: \(response.statusCode)")
                    return Fail(error: APIError.httpError(code: response.statusCode)).eraseToAnyPublisher()
                }
                return Just(data)
                    .decode(type: T.self, decoder: decoder)
                    .mapError { error in
                        print("### Decoding error: \(error)")
                        return APIError.decodingError
                    }.eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
