//
//  DataController.swift
//  Friendly
//
//  Created by Prabhdeep Singh on 28/03/23.
//

import CoreData
import Foundation

class DataController {
    //Tells core data from where to load the contents
    let container = NSPersistentContainer(name: "FriendlyModel")
    init() {
        //loads the data
        container.loadPersistentStores { descr, error in
            if let error {
                print("error in loading core data \(error.localizedDescription)")
                return
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
