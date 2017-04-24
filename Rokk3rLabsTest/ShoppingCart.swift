//
//  ShoppingCart.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation

final class ShoppingCart {
    var products = [Product]()
    
    private init() {}
    static let shared = ShoppingCart()
    
    var totalSpent: Double {
        return products
            .map { $0.price * Double($0.stock) }
            .reduce(0, +)
    }
    
    func add(product: Product) {
        if let index = products.index(where: { (_ _product: Product) -> Bool in
            return _product.id == product.id
        }) {
            products[index].stock += 1
        } else {
            var newProduct = product
            newProduct.stock = 1
            products.append(newProduct)
        }
    }
    
    func remove(product: Product) {
        if let index = products.index(where: { (_ _product: Product) -> Bool in
            return _product.id == product.id
        }) {
            products[index].stock -= 1
            if products[index].stock == 0 {
                products.remove(at: index)
            }
        } else {
            return
        }
    }
}
