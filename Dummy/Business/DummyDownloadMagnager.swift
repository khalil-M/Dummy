//
//  DummyDownloadMagnager.swift
//  Dummy
//
//  Created by Khalil on 6/10/23.
//

import Foundation


import Foundation
import Combine

protocol DummyDownloadManager {
    func getProducts()
}

final class DummyDownloadMagnager: ObservableObject, DummyDownloadManager {
    
    @Published var products = [Product]()
    private var cancellables = Set<AnyCancellable>()
    
    var baseURL = "https://dummyjson.com/products"
    
    func getProducts() {
        getDummy(productUrl: self.baseURL)
    }
    
    
    private func getDummy(productUrl: String) {
        NetworkManager<DummyResponse>
            .fetch(from: productUrl)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] response in
                print(response)
                self?.products = response.products
            }
            .store(in: &cancellables)
    }
}
