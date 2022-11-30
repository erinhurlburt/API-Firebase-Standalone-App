//
//  CookbookAPI.swift
//  Babel Beauty
//
//  Created by Erin Hurlburt on 4/30/22.
//

import Foundation

let MAKEUP_ROOT = "https://makeup-api.herokuapp.com/api/v1/products.json"
let SEARCH_ENDPOINT = "\(MAKEUP_ROOT)"

enum MakeupAPIError: Error {
    case unsuccessfulDecode
}

func searchMakeup(name: String, brand: String, product_type: String) async throws -> [Makeup] {
    // There are more structured ways to construct a URL with query parameters but
    // this suffices for this fixed pair.
    guard let url = URL(string: "\(SEARCH_ENDPOINT)?name=\(name)&brand=\(brand)&product_type=\(product_type)") else {
        fatalError("Should never happen, but just in case…URL didn’t work 😔")
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    if let decodedPage = try? JSONDecoder().decode([Makeup].self, from: data) {
        return decodedPage
    } else {
        throw MakeupAPIError.unsuccessfulDecode
    }
}
