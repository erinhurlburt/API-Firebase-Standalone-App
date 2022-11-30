//
//  ContentView.swift
//  Babel Beauty
//
//  Created by Sebastian Cruz on 4/30/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            APIView()
                .tabItem {
                    Label("Cosmetic Library",
                          systemImage:
                            "books.vertical.fill")
                }
            
            Blog()
                .tabItem {
                    Label("Reviews",
                          systemImage:
                            "pin.circle")
                }
                .colorMultiply(Color("pink"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BabelBeautyAuth())
    }
}

