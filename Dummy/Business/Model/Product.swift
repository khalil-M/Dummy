//
//  Product.swift
//  Dummy
//
//  Created by Khalil on 6/10/23.
//

import Foundation





// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
