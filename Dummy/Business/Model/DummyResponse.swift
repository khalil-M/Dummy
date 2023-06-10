//
//  DummyResponse.swift
//  Dummy
//
//  Created by Khalil on 6/10/23.
//

import Foundation


struct DummyResponse: Codable {
    let products: [Product]
    let total, skip, limit: Int
}
