//
//  Product.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation
import ObjectMapper

struct Product {
    
    var id          : Int?
    var name        : String?
    var imageURL    : String?
    var price       : Double?
    var stock       : Int?
    
}

extension Product: Mappable {
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        imageURL    <- map["image_url"]
        price       <- map["price"]
        stock       <- map["stock"]
    }
}
