//
//  ProductViewModel.swift
//  Dummy
//
//  Created by Khalil on 6/10/23.
//

import Foundation


import Foundation
import Combine

protocol DummyDownloadManager {
    // Protocol defining the method to get products
    func getProducts()
}

final class ProductViewModel: ObservableObject, DummyDownloadManager {
    
    // Published property to store the products
    @Published var products = [Product]()
    private var cancellables = Set<AnyCancellable>()
    
    // Base URL for the product data
    var baseURL = "https://dummyjson.com/products"
    
    // Method to fetch the products
    func getProducts() {
        getDummy(productUrl: self.baseURL)
    }
    
    // Private method to fetch data using the NetworkManager
    private func getDummy(productUrl: String) {
        NetworkManager<ProductResponse>
        // Fetch data using NetworkManager
            .fetch(from: productUrl)
        // Handle completion of the publisher
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            // Handle the received value (response)
            } receiveValue: { [weak self] response in
                print(response)
                self?.products = response.products
            }
            .store(in: &cancellables) // Store the cancellable reference
    }
}
