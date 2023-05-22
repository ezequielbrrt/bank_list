//
//  AppDelegate+SetupUI.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//

import UIKit

extension AppDelegate {

    func setupUI() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = BanksListRouter.createBanksListModule()
        let navigationViewController = UINavigationController(rootViewController: viewController)

        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()

        self.window = window
    }
}
