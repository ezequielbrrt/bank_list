//
//  CoreDataStack.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//

import CoreData

class CoreDataStack {

    // MARK: - Private Properties

    private let modelName: String

    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    // MARK: - Internal Properties
    
    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext

    // MARK: - Initialization

    init(modelName: String) {
        self.modelName = modelName
    }

    // MARK: - Internal Methods

    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
}
