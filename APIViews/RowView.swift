//
//  RowView.swift
//  Babel Beauty
//
//  Created by Erin Hurlburt on 4/30/22.
//

import SwiftUI

let ARTWORK_HEIGHT = 30.0

struct RowView: View {
    var makeup: Makeup
    
    var body: some View {
        // Presumably this feels very familiar…
        HStack {
            AsyncImage(url: URL(string: makeup.image_link ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 70.0, maxHeight: 90.0)
            .padding(.trailing, 5.0)
            
            Text(makeup.name ?? "")
            Spacer()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(makeup: Makeup(
            id: 1048,
            brand: "colourpop",
            name: "Lippie Pencil",
            product_type: "lip_liner",
            description: "Lippie Pencil A long-wearing and high-intensity lip pencil that glides on easily and prevents feathering. Many of our Lippie Stix have a coordinating Lippie Pencil designed to compliment it perfectly, but feel free to mix and match!",
            image_link: "https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769"
        ))
    }
}

