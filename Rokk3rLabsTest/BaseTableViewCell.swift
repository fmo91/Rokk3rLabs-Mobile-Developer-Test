//
//  BaseTableViewCell.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    // MARK: - Life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

}
