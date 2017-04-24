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
            .map (excludeProductsWithoutStock)
            .map (calculateShoppingCartProducts)
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
    
    private func calculateShoppingCartProducts(from products: [Product]) -> [Product] {
        let newProducts = products
        
        for shoppingCartProduct in ShoppingCart.shared.products {
            if var product = newProducts
                .filter({ $0.id == shoppingCartProduct.id })
                .first {
                product.stock -= shoppingCartProduct.stock
            }
        }
        
        return newProducts
    }
    
    func didPressBuy(product: Product) {
        let products = self.products.value
        var newProducts = [Product]()

        for var _product in products {
            if _product.id == product.id {
                _product.stock -= 1
            }
            newProducts.append(_product)
        }
        
        ShoppingCart.shared.add(product: product)
    
        self.products.value = newProducts
            .filter { product in
                return product.stock > 0
            }
    }
    
    func didPressRemove(product: Product) {
        let products = self.products.value
        var newProducts = products
        
        if let index = products.index(where: { (prod: Product) -> Bool in
            return prod.id == product.id
        }) {
            newProducts[index].stock += 1
        } else {
            newProducts.append(product)
        }
        
        self.products.value = newProducts
    }
}
