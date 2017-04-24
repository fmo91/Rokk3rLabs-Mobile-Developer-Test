//
//  AppDelegate.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Attributes -
    var window: UIWindow?

    // MARK: - Application life cycle -
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        startApplication()

        return true
    }
    
    private func startApplication() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let dummyDataManager = DataManager.dummyManager()
        let productsListViewModel = RLProductsListViewModel(dataManager: dummyDataManager)
        let productsListViewController = ProductsListViewController(viewModel: productsListViewModel)
        
        let initialNavigationController = BaseNavigationController(rootViewController:
            productsListViewController)
        
        self.window?.rootViewController = initialNavigationController
        self.window!.makeKeyAndVisible()
    }
}

