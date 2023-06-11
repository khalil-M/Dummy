//
//  ProductDetailView.swift
//  Dummy
//
//  Created by Khalil on 6/11/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        ZStack(alignment: .top) {
//            backgroundView
            ScrollView(.vertical, showsIndicators: false)  {
                VStack {
                    headerView
//                    moviePosterView
                    productDescription
//                    reviewLink
                }
                .padding(.top, 84)
                .padding(.horizontal, 32)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private var headerView: some View {
        VStack(alignment: .leading) {
            Text(product.title)
                .font(.title)
            Text("Category: \(product.category ?? "_")")
                .font(.subheadline)
        }
        .foregroundColor(.white)
    }
    
//    private var moviePosterView: some View {
//        HStack(alignment: .center) {
//            Spacer()
//            CachedAsyncImage(url: URL(string: movie.posterPath)) { img in
//                img.resizable()
//            } placeholder: {
//                Rectangle().foregroundColor(Color.gray.opacity(0.4))
//            }
//            .frame(width: 200, height: 320)
//            .animation(.easeInOut(duration: 0.5))
//            .transition(.opacity)
//            .scaledToFill()
//            .cornerRadius(20)
//            Spacer()
//        }
//    }
    
//    private var x: some View {
//        CachedAsyncImage(url: URL(string: movie.posterPath)) { img in
//            img.resizable()
//        } placeholder: {
//            Rectangle().foregroundColor(Color.gray.opacity(0.4))
//        }
//        .blur(radius: 100)
//    }
    
    private var productDescription: some View {
        Text(product.description ?? "")
            .foregroundColor(.white)
            .font(.body)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.top, 16)
    }
    
//    private var reviewLink: some View {
//        VStack {
//            Divider()
//            NavigationLink {
//                MovieReviewView()
//            } label: {
//                HStack {
//                    Text("Reviews")
//                        .font(.body)
//                        .fontWeight(.medium)
//                    Spacer()
//                }
//            }
//            Divider()
//        }
//        .foregroundColor(.white)
//    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
