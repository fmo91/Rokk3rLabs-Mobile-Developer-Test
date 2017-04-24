//
//  ProductsListViewController.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit

class ProductsListViewController: BaseViewController {
    
    // MARK: - Views -
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Attributes -
    let viewModel: ProductsListViewModel
    var tableViewAdapter: ProductsListTableViewAdapter!

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewAdapter = ProductsListTableViewAdapter(tableView: tableView)
        
        viewModel
            .products.asObservable()
            .subscribe(onNext: didReceiveProducts)
            .addDisposableTo(disposeBag)
        
        viewModel.reload()
    }
    
    // MARK: - Init -
    init(viewModel: ProductsListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration -
    
    private func didReceiveProducts(_ products: [Product]) {
        tableViewAdapter?.reload(with: products)
    }

}
