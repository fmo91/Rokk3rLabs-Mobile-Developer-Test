//
//  Product.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Product: Mappable {
    var id          : Int       = -1
    var name        : String    = ""
    var imageURL    : String    = ""
    var price       : Double    = 0.0
    var stock       : Int       = 0
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        imageURL    <- map["image_url"]
        price       <- map["price"]
        stock       <- map["stock"]
    }
}
