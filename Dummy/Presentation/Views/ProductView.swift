//
//  ProductView.swift
//  Dummy
//
//  Created by Khalil on 6/10/23.
//

import Foundation
import SwiftUI

struct ProductView: View {
    @ObservedObject var viewModel = ProductViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Search bar at the top with padding adjustments
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                List {
                    ForEach(viewModel.products.filter { searchText.isEmpty || $0.title.localizedCaseInsensitiveContains(searchText) }) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductCell(product: product)
                        }
                        .buttonStyle(.plain)
                        .listRowBackground(Color.clear)
                    }
                }
                .listStyle(.plain)
                .onAppear {
                    viewModel.getProducts()
                }
            }
        }
        // Set the navigation title
        .navigationTitle("Products")
    }
}


//struct ProductsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductView()
//    }
//}
