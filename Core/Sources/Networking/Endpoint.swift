//
//  Endpoint.swift
//  Packages
//
//  Created by Oleksa on 1/18/22.
//

import Foundation

public struct Endpoint {
    let path: String
    var query: [URLQueryItem]?
    
    public init(path: String, query: [URLQueryItem]? = nil) {
        self.path = path
        self.query = query
    }
}

public extension Endpoint {
    var url: URL {
        var comps = URLComponents()
        comps.scheme = "https"
        comps.host = "my-json-server.typicode.com"
        comps.path = "/alounce/demo/\(path)"
        comps.queryItems = query
        guard let url = comps.url else { fatalError("URL is invalid") }
        return url
    }
    
    var headers: [String: Any] {
        [
            "Content-Type": "application/json"
        ]
    }
}


