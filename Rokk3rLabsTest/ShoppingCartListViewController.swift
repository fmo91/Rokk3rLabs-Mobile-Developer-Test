//
//  ShoppingCartListViewController.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit

protocol ShoppingCartListViewControllerDelegate: class {
    func didSelectRemove(product: Product)
}

class ShoppingCartListViewController: BaseViewController {
    
    // MARK: - Views -
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Attributes -
    weak var delegate: ShoppingCartListViewControllerDelegate?
    let viewModel: ShoppingCartListViewModel
    var tableViewAdapter: ShoppingCartListTableViewAdapter!

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureTableViewAdapter()
        configureViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.reload()
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
    
    // MARK: - Configuration -
    private func configureNavigationBar() {
        title = "Shopping Cart"
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonPressed))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func configureTableViewAdapter() {
        tableViewAdapter = ShoppingCartListTableViewAdapter(tableView: tableView)
        tableViewAdapter.delegate = self
    }
    
    private func configureViewModel() {
        viewModel
            .products.asObservable()
            .subscribe(onNext: didReceiveProducts)
            .addDisposableTo(disposeBag)
        
        viewModel.reload()
    }
    
    private func didReceiveProducts(_ products: [Product]) {
        tableViewAdapter?.reload(products: products)
    }
    
    // MARK: - Actions -
    @objc private func doneButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - ShoppingCartListTableViewAdapterDelegate -
extension ShoppingCartListViewController: ShoppingCartListTableViewAdapterDelegate {
    func productsListTableViewAdapterDidSelectRemove(on product: Product) {
        viewModel.didPressRemove(product: product)
        delegate?.didSelectRemove(product: product)
    }
}















