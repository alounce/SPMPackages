//
//  APIStubService.swift
//  Packages
//
//  Created by Oleksa on 1/18/22.
//

import Foundation
import Combine

public final class APIStubService: API {
    
    public func load<T>(request: URLRequest) -> AnyPublisher<T, APIError> where T : Decodable {
        Future { promice in
            // simulate network call on the global queue
            // (do not forget to handle it in the main queue)
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
                
                var items: T
                do {
                    items = try JSONDecoder().decode(T.self, from: raw)
                } catch {
                    return promice(.failure(APIError.invalidJSON(resourceName)))
                }
                
                print("###: Load Product Thread: \(Thread.current)")
                
                return promice(.success(items))
            }
        }.eraseToAnyPublisher()
    }
}
