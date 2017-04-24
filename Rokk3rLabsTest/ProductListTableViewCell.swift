//
//  ProductListTableViewCell.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit

protocol ProductListTableViewCellDelegate: class {
    func productListTableViewCellDidPressBuyButton(on cell: ProductListTableViewCell)
}

class ProductListTableViewCell: BaseTableViewCell, Dequeuable, Registrable {
    
    // MARK: - Views -
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productStockLabel: UILabel!
    
    // MARK: - Attributes -
    weak var delegate: ProductListTableViewCellDelegate?

    // MARK: - Life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        productImageView.cancelDownload()
    }
    
    // MARK: - Configuration -
    func configure(product: Product) {
        productImageView.load(urlString: product.imageURL)
        productNameLabel.text = product.name
        productPriceLabel.text = "Price: \(product.price)"
        productStockLabel.text = "Stock: \(product.stock)"
    }
    
    // MARK: - Size -
    static var height: CGFloat {
        return 100.0
    }
    
    // MARK: - Actions -
    @IBAction func buyButtonPressed(_ sender: Any) {
        delegate?.productListTableViewCellDidPressBuyButton(on: self)
    }
}
