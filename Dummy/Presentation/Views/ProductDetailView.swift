//
//  ProductDetailView.swift
//  Dummy
//
//  Created by Khalil on 6/11/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    // Initialize the view with a product
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            backgroundView // Background view with a blurred product thumbnail
            ScrollView(.vertical, showsIndicators: false)  {
                VStack {
                    headerView
                    productPosterView
                    productDescription
                }
                .padding(.top, 84)
                .padding(.horizontal, 32)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    // View displaying the header (product title and category)
    private var headerView: some View {
        VStack(alignment: .leading) {
            Text(product.title)
                .font(.title)
            Text("Category: \(product.category ?? "_")")
                .font(.subheadline)
        }
        .foregroundColor(.white)
    }
  
    // View displaying the horizontal scrollable product posters
    private var productPosterView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(product.images, id: \.self) { imageURL in
                    CachedAsyncImage(url: URL(string: imageURL)) { img in
                        img
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 320)
                            .cornerRadius(20)
                    } placeholder: {
                        Rectangle()
                            .foregroundColor(Color.gray.opacity(0.4))
                            .frame(width: 200, height: 320)
                            .cornerRadius(20)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    // Background view with a blurred product thumbnail
    private var backgroundView: some View {
        CachedAsyncImage(url: URL(string: product.thumbnail)) { img in
            img.resizable()
        } placeholder: {
            Rectangle().foregroundColor(Color.gray.opacity(0.4))
        }
        .blur(radius: 100)
    }
    
    // View displaying the product description
    private var productDescription: some View {
        Text(product.description ?? "")
            .foregroundColor(.white)
            .font(.body)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.top, 16)
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
