//
//  ListView.swift
//  Babel Beauty
//
//  Created by Erin Hurlburt on 4/30/22.
//

import SwiftUI

struct ListView: View {
    var searchName: String
    var searchBrand: String
    var searchType: String
    
    @State var loading = false
    @State var errorOccurred = false
    @State var results: [Makeup] = []
    
    var body: some View {
        NavigationView {
            VStack {
                if loading {
                    ProgressView()
                } else if errorOccurred {
                    // Very bare bones of course; robust apps will do this better.
                    Text("Sorry, something went wrong.")
                } else {
                    //List(results, id: \.id) { item in
                    List {
                        ForEach(results, id: \.id) { item in
                            NavigationLink {
                                DetailView(makeup: item)
                            } label: {
                                RowView(makeup: item)
                                    .navigationBarHidden(true)
                            }
                            
                        }
                        
                        
                    }.refreshable {
                        await loadSearchResults()
                    }
                    
                }
            }
            
            .task(id: searchType) {
                await loadSearchResults()
            }
        }

    }
    
    func loadSearchResults() async {
        errorOccurred = false
        loading = true
        
        do {
            let searchPage = try await searchMakeup(name: searchName, brand: searchBrand, product_type: searchType)
            results = searchPage
        } catch {
            errorOccurred = true
            
            // Only a dev will be able to see this, of course.
            debugPrint("Unexpected error: \(error)")
        }
        
        loading = false
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(searchName: "", searchBrand: "", searchType: "lipstick")
    }
}

