//
//  APIView.swift
//  Babel Beauty
//
//  Created by Erin Hurlburt on 4/30/22.
//
import SwiftUI

struct makeupCategory {
    let label: String
    let type: String
}

struct APIView: View {
    let SEARCHABLE_CATEGORIES = [
        makeupCategory(label: "Lipstick", type: "lipstick"),
        makeupCategory(label: "Mascara", type: "mascara"),
        //makeupCategory(label: "Foundation", type: "foundation"),
        makeupCategory(label: "Eyeshadow", type: "eyeshadow"),
        //makeupCategory(label: "Blush", type: "blush")
    ]
    
    
    @State var name: String = ""
    @State var brand: String = ""
    @State  var product_type = "mascara"
    

    var body: some View {
        
        VStack {
            HStack {
                TextField("Enter Name ", text: $name)
                //Text("Status: \(status)")
                //Text("Searching for:")
                //Text(status)
                    //.bold()
                    //.italic()
                TextField("Enter Brand ", text: $brand)
                //Text("Species: \(species)")
                //Text(species)
                    //.bold()
                    //.italic()
            }
            .padding(.horizontal)
            .padding()
            
            Picker("", selection: $product_type) {
                ForEach(SEARCHABLE_CATEGORIES, id: \.type) {
                    searchableCategory in Text(searchableCategory.label)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            ListView(searchName: name, searchBrand: brand, searchType: product_type)

              
        }
    }
}


struct APIView_Previews: PreviewProvider {
    static var previews: some View {
        APIView()
    }
}
