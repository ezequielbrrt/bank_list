//
//  AppDelegate.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Core Data
    lazy var coreDataStack: CoreDataStack = .init(modelName: BankStorageService.shared.modelName)

    static let sharedAppDelegate: AppDelegate = {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unexpected app delegate type, did it change? \(String(describing: UIApplication.shared.delegate))")
        }
        return delegate
    }()

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupUI()

        return true
    }
}

