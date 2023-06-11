//
//  ProductCell.swift
//  Dummy
//
//  Created by Khalil on 6/11/23.
//

import Foundation
import SwiftUI


struct ProductCell: View {
    let product: Product
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            productPoster
            VStack(alignment: .leading, spacing: 0) {
                movieTitle
                HStack{
                    productRates
                    productCategory
                }
                productDescription
            }
        }
    }
    
    // View displaying the product rates
    @ViewBuilder
    private var productRates: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(product.formattedRating))
                .stroke( Color.orange, lineWidth: 4)
                .frame(width: 50)
                .rotationEffect(.degrees(-90))
            Circle()
                .trim(from: 0, to: 1)
                .stroke(Color.orange.opacity(0.2), lineWidth: 4)
                .frame(width: 50)
                .rotationEffect(.degrees(-90))
            Text(String.init(format: "%0.2f", product.formattedRating ?? 0.0))
                .foregroundColor(.orange)
                .font(.subheadline)
        }
    }
    
    // View displaying the movie title
    private var movieTitle: some View {
        Text(product.title)
            .font(.system(size: 15))
            .bold()
            .foregroundColor(.blue)
    }
    
    // View displaying the product poster
    private var productPoster: some View {
        CachedAsyncImage(url: URL(string: product.thumbnail)) { img in
            img.resizable()
        } placeholder: {
            Rectangle().foregroundColor(Color.gray.opacity(0.4))
        }
        .frame(width: 100, height: 160)
        .animation(.easeInOut(duration: 0.5))
        .transition(.opacity)
        .scaledToFill()
        .cornerRadius(15)
        .shadow(radius: 15)
    }
    
    // View displaying the product category
    private var productCategory: some View {
        Text(product.category ?? "")
            .foregroundColor(.black)
            .font(.subheadline)
    }
    
    // View displaying the product description
    private var productDescription: some View {
        Text(product.description ?? "")
            .foregroundColor(.gray)
            .font(.body)
            .lineLimit(3)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        
        ProductCell(product: Product(id: 2, title: "Iphone 15 Pro", description: "An apple mobile which is nothing like apple", price: 2090, discountPercentage: 12.96, rating: 6.7, stock: 6, brand: "Apple", category: "smartphones", images: ["String"]))
    }
}
