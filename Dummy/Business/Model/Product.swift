//
//  Product.swift
//  Dummy
//
//  Created by Khalil on 6/10/23.
//

import Foundation





// MARK: - Product
struct Product: Codable, Identifiable {
    var id: Int
    var title, description: String
    var price: Int
    var discountPercentage: Double
    var rating: Double
    var stock: Int
    var brand, category: String
    var thumbnail: String {
        return "https://i.dummyjson.com/data/products/\(id)/thumbnail.jpg"
    }
    var formattedRating: Double {
            return rating / 10
    }
    var images: [String]
}
