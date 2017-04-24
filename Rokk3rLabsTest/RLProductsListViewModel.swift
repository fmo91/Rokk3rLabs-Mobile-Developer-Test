//
//  RLProductsListViewModel.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation

final class RLProductsListViewModel: ProductsListViewModel {
    
    // MARK: - Attributes -
    let dataManager: DataManager
 
    // MARK: - Init -
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
}
