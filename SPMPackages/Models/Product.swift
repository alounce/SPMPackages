//
//  Product.swift
//  Packages
//
//  Created by Oleksa on 1/17/22.
//

import Foundation

typealias Products = [Product]

struct Product: Codable, Hashable {
    
    let id: Int
    let title: String
    let details: String
    let price: Int
}





