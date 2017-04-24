//
//  RLProductsListViewModel.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation
import RxSwift

final class RLProductsListViewModel: ProductsListViewModel {
    
    // MARK: - Attributes -
    let disposeBag = DisposeBag()
    let dataManager: DataManager
    
    var products: Variable<[Product]> = Variable<[Product]>([])
 
    // MARK: - Init -
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    // MARK: - Public -
    func reload() {
        dataManager
            .getProducts()
            .subscribe(
                onNext: { products in
                    self.products.value = products
                }
            )
            .addDisposableTo(disposeBag)
    }
    
    func didPressBuy(product: Product) {
        let products = self.products.value
        var newProducts = [Product]()

        for _product in products {
            if _product.id == product.id {
                _product.stock -= 1
            }
            newProducts.append(_product)
        }
    
        self.products.value = newProducts
    }
    
}
