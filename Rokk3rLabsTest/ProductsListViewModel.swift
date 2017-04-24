//
//  ProductsListViewModel.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation
import RxSwift

protocol ProductsListViewModel {
    
    var products: Variable<[Product]> { get }
    
    func reload()
    func didPressBuy(product: Product)
    
}
