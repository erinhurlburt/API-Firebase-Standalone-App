//
//  Makeup.swift
//  Babel Beauty
//
//  Created by Erin Hurlburt on 4/30/22.
//

import Foundation

struct Makeup: Hashable, Codable {
    var id: Int?
    var brand: String?
    var name: String?
    var product_type: String?
    //var price: String
    var description: String?
    var image_link: String?
}

//struct MakeupSearchPage: Hashable, Codable {
//    var results: [Makeup]
//}

