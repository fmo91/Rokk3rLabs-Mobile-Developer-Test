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
    @IBOutlet weak var shoppingCartContainer: UIView!
    @IBOutlet weak var shoppingCartTotalSpentLabel: UILabel!
    @IBOutlet weak var shoppingCartProductsCountLabel: UILabel!
    
    // MARK: - Attributes -
    let viewModel: ProductsListViewModel
    var tableViewAdapter: ProductsListTableViewAdapter!

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureTableViewAdapter()
        configureViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        didReceiveProducts(viewModel.products.value)
        configureShoppingCartProductsIndicator()
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
    
    private func configureNavigationBar() {
        title = "Products"
    }
    
    private func configureTableViewAdapter() {
        tableViewAdapter = ProductsListTableViewAdapter(tableView: tableView)
        tableViewAdapter.delegate = self
    }
    
    private func configureViewModel() {
        viewModel
            .products.asObservable()
            .subscribe(onNext: didReceiveProducts)
            .addDisposableTo(disposeBag)
        
        viewModel.reload()
    }
    
    fileprivate func didReceiveProducts(_ products: [Product]) {
        tableViewAdapter?.reload(with: products)
    }
    
    fileprivate func configureShoppingCartProductsIndicator() {
        let productsCount = ShoppingCart.shared.products.count
        if productsCount > 0 {
            shoppingCartProductsCountLabel.text = productsCount.description
            shoppingCartContainer.isHidden = false
        } else {
            shoppingCartContainer.isHidden = true
        }
        
        let totalSpent = ShoppingCart.shared.totalSpent
        shoppingCartTotalSpentLabel.text = "Total spent: $\(totalSpent)"
    }

    // MARK: - Actions -
    @IBAction func shoppingCartBarButtonPressed() {
        let shoppingCartViewController = ShoppingCartListViewController.instantiate()
        let shoppingCartNavigationController = BaseNavigationController(rootViewController: shoppingCartViewController)
        shoppingCartViewController.delegate = self
        self.present(shoppingCartNavigationController, animated: true, completion: nil)
    }
}

// MARK: - ProductsListTableViewAdapterDelegate -
extension ProductsListViewController: ProductsListTableViewAdapterDelegate {
    func productsListTableViewAdapterDidSelectBuy(on product: Product) {
        viewModel.didPressBuy(product: product)
        configureShoppingCartProductsIndicator()
    }
}

// MARK: - ShoppingCartListViewControllerDelegate -
extension ProductsListViewController: ShoppingCartListViewControllerDelegate {
    func didSelectRemove(product: Product) {
        viewModel.didPressRemove(product: product)
        configureShoppingCartProductsIndicator()
    }
}

