//
//  ProductsListTableViewAdapter.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit

class ProductsListTableViewAdapter: NSObject {
    
    // MARK: - Attributes -
    let tableView: UITableView
    
    fileprivate var products = [Product]()
    
    // MARK: - Init -
    init(tableView: UITableView) {
        self.tableView = tableView
        
        super.init()
        
        configureTableView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Configuration -
    func configureTableView() {
        ProductListTableViewCell.register(in: tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Public -
    
    func reload(with products: [Product]) {
        self.products = products
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource -
extension ProductsListTableViewAdapter: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProductListTableViewCell.dequeue(from: tableView)
        
        let product = products[indexPath.row]
        cell.configure(product: product)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProductListTableViewCell.height
    }
}




















