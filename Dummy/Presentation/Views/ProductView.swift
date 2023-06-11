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
        VStack {
            SearchBar(text: $searchText)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            List {
                ForEach(viewModel.products.filter { searchText.isEmpty || $0.title.localizedCaseInsensitiveContains(searchText) }) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
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
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}