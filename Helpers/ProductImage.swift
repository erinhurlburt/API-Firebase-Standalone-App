//
//  ProductImage.swift
//  Babel Beauty
//
//  Created by Erin Hurlburt on 5/3/22.
//

import SwiftUI

struct ProductImage: View {
    let imageDimension: CGFloat = 96.0 // Dictated by the API.
    var imageUrl: String

    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
        } placeholder: {
            ProgressView()
        }.frame(
            width: imageDimension, height: imageDimension, alignment: .center
        )
    }
}

struct ProductImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductImage(imageUrl: "https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769")

    }
}
