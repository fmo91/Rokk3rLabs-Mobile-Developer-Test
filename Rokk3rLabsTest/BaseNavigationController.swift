//
//  BaseNavigationController.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    private let mainColor = UIColor(red: 118 / 255.0, green: 97 / 255.0, blue: 241 / 255.0, alpha: 1.0)
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        edgesForExtendedLayout = []
        
        self.navigationBar.isTranslucent = true
        self.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.boldSystemFont(ofSize: 17.0)
        ]
        
        self.navigationBar.barTintColor = mainColor
        self.navigationBar.tintColor = .white
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
