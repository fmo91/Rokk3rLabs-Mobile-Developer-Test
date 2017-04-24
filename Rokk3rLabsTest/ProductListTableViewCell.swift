//
//  ProductListTableViewCell.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit
import DequeuableRegistrable

class ProductListTableViewCell: UITableViewCell, Dequeuable, Registrable {
    
    // MARK: - Views -
    
    // MARK: - Attributes -

    // MARK: - Life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Configuration -
    func configure(product: Product) {
        
    }
    
    // MARK: - Size -
    static var height: CGFloat {
        return 100.0
    }
    
}
