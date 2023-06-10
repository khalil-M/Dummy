//
//  DummyView.swift
//  Dummy
//
//  Created by Khalil on 6/10/23.
//

import Foundation
import SwiftUI

struct DummyView: View {
    
    @ObservedObject var dummyManager = DummyDownloadMagnager()
    
    var body: some View {
        VStack {
            List {
                ForEach(dummyManager.products) { movie in
                    NavigationLink {
//                        MovieDetailView(movie: movie)
                    } label: {
//                        MovieCell(movie: movie)
                    }
                    .buttonStyle(.plain)
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .onAppear {
                dummyManager.getProducts()
            }
        }
        
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
    }
}
