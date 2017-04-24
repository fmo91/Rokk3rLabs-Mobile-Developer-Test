//
//  RLShoppingCartListViewModel.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation
import RxSwift

final class RLShoppingCartListViewModel: ShoppingCartListViewModel {
    
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
        Observable.just(ShoppingCart.shared.products)
            .map (excludeProductsWithoutStock)
            .subscribe(
                onNext: { products in
                    self.products.value = products
                }
            )
            .addDisposableTo(disposeBag)
    }
    
    private func excludeProductsWithoutStock(from products: [Product]) -> [Product] {
        return products
            .filter { product in
                return product.stock > 0
        }
    }
    
    func didPressRemove(product: Product) {
        let products = self.products.value
        var newProducts = [Product]()
        
        for var _product in products {
            if _product.id == product.id {
                _product.stock -= 1
            }
            newProducts.append(_product)
        }
        
        ShoppingCart.shared.remove(product: product)
        
        self.products.value = newProducts
            .filter { product in
                return product.stock > 0
            }
    }
    
}
