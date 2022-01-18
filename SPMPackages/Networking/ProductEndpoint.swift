//
//  ProductEndpoint.swift
//  Packages
//
//  Created by Oleksa on 1/18/22.
//

import Foundation
import Networking

extension Endpoint {
    static var allProducts: Self {
        Endpoint(path: "products", query: nil)
    }
}
