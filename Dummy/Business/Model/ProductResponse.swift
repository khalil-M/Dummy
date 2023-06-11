//
//  ProductResponse.swift
//  Dummy
//
//  Created by Khalil on 6/10/23.
//

import Foundation

// Response from API
struct ProductResponse: Codable {
    var products: [Product]
    var total, skip, limit: Int
}
