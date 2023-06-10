//
//  DummyManager.swift
//  Dummy
//
//  Created by Khalil on 6/10/23.
//

import Foundation

final class DummyManager: ObservableObject {
    static var baseURL = "https://dummyjson.com/products"
    
    private func getReview(for product: Product) {
        let urlString = "\(Self.baseURL)\(product.id ?? 100)"
        // TODO
        // implement the fetch
        // publish the resultss
    }
}
