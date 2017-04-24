//
//  ProductsListViewController.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit

class ProductsListViewController: BaseViewController {
    
    // MARK: - Attributes -
    let viewModel: ProductsListViewModel

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Init -
    init(viewModel: ProductsListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
