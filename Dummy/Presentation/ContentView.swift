//
//  ContentView.swift
//  Dummy
//
//  Created by Khalil on 6/10/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            Group {
                ProductView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
