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
        
        configureNavigationBar()
        configureTableViewAdapter()
        configureViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        didReceiveProducts(viewModel.products.value)
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
        let shoppingCartBarButton = UIBarButtonItem(title: "Cart", style: UIBarButtonItemStyle.done, target: self, action: #selector(shoppingCartBarButtonPressed))
        
        navigationItem.rightBarButtonItem = shoppingCartBarButton
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

    // MARK: - Actions -
    @objc private func shoppingCartBarButtonPressed() {
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
    }
}

// MARK: - ShoppingCartListViewControllerDelegate -
extension ProductsListViewController: ShoppingCartListViewControllerDelegate {
    func didSelectRemove(product: Product) {
        viewModel.didPressRemove(product: product)
    }
}

