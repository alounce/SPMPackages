//
//  API.swift
//  Packages
//
//  Created by Oleksa on 1/17/22.
//

import Foundation
import Combine


protocol API {
    func load<T>(request: URLRequest) -> AnyPublisher<T, APIError> where T: Decodable
}

