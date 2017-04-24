//
//  ShoppingCartListViewModel.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation
import RxSwift

protocol ShoppingCartListViewModel {
    
    var products: Variable<[Product]> { get }
    
    func reload()
    func didPressRemove(product: Product)
    
}
