//
//  ShoppingCartListTableViewAdapter.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit

protocol ShoppingCartListTableViewAdapterDelegate: class {
    func productsListTableViewAdapterDidSelectRemove(on product: Product)
}

final class ShoppingCartListTableViewAdapter: NSObject {
    
    // MARK: - Attributes -
    let tableView: UITableView
    weak var delegate: ShoppingCartListTableViewAdapterDelegate?
    fileprivate var products = [Product]()
    
    // MARK: - Init -
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        configure()
    }
    
    // MARK: - Configuration -
    private func configure() {
        ShoppingCartProductTableViewCell.register(in: tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    func reload(products: [Product]) {
        self.products = products
        self.tableView.reloadData()
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource -
extension ShoppingCartListTableViewAdapter: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ShoppingCartProductTableViewCell.dequeue(from: tableView)
        
        let product = products[indexPath.row]
        cell.configure(product: product)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ShoppingCartProductTableViewCell.height
    }
}

// MARK: - ProductListTableViewCellDelegate -
extension ShoppingCartListTableViewAdapter: ShoppingCartProductTableViewCellDelegate {
    func shoppingCartProductTableViewCellDidPressRemoveButton(on cell: ShoppingCartProductTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        let product = products[indexPath.row]
        
        delegate?.productsListTableViewAdapterDidSelectRemove(on: product)
    }
}
























