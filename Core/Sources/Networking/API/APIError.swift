//
//  APIError.swift
//  Packages
//
//  Created by Oleksa on 1/17/22.
//

import Foundation

public enum APIError: Error {
    case invalidLocalResource(String)
    case invalidLocalResourceContent(String)
    case invalidJSON(String)
    case invalidURL
    case insecureConnection
    case httpError(code: Int)
    case decodingError
    case generic
}
