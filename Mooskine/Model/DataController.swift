//
//  DataController.swift
//  Mooskine
//
//  Created by 嶋田省吾 on 2021/11/13.
//  Copyright © 2021 Udacity. All rights reserved.
//

import Foundation
import CoreData

//DataController: This holds a persistent container instance, help us load the persistent store, and help us access the context.
class DataController{
    //Persistent container
    let persistentContainer: NSPersistentContainer
    
    var viewContext:NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores{ storeDescription, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            self.autoSaveViewContext()
            completion?()
        }
    }
    
}

extension DataController{
    func autoSaveViewContext(interval: TimeInterval = 30) {
        print("autosaving")
        guard interval > 0 else {
            print("cannot set negative autosave interval")
            return
        }
        if viewContext.hasChanges{
            try? viewContext.save()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveViewContext(interval: interval)
        }
    }
}
