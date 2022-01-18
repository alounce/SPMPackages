//
//  API.swift
//  Packages
//
//  Created by Oleksa on 1/17/22.
//

import Foundation
import Combine


public protocol API {
    // generic base method (will be used by more specialized call)
    func load<T>(request: URLRequest) -> AnyPublisher<T, APIError> where T: Decodable
}

