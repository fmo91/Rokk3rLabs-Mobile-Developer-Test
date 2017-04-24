//
//  ShoppingCartListViewController.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit

class ShoppingCartListViewController: BaseViewController {
    
    // MARK: - Views -
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Attributes -
    let viewModel: ShoppingCartListViewModel
    var tableViewAdapter: ShoppingCartListTableViewAdapter!

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewAdapter = ShoppingCartListTableViewAdapter(tableView: tableView)
        tableViewAdapter.delegate = self
        
    }
    
    // MARK: - Init -
    init(viewModel: ShoppingCartListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func instantiate() -> ShoppingCartListViewController {
        let viewModel = RLShoppingCartListViewModel(dataManager: DataManager.dummyManager())
        let viewController = ShoppingCartListViewController(viewModel: viewModel)
        return viewController
    }
    
}

// MARK: - ShoppingCartListTableViewAdapterDelegate -
extension ShoppingCartListViewController: ShoppingCartListTableViewAdapterDelegate {
    func productsListTableViewAdapterDidSelectRemove(on product: Product) {
        viewModel.didPressRemove(product: product)
    }
}















