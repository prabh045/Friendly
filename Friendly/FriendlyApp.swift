//
//  FriendlyApp.swift
//  Friendly
//
//  Created by Prabhdeep Singh on 27/03/23.
//

import SwiftUI

@main
struct FriendlyApp: App {
    let dataController = DataController()
    var body: some Scene {
        //Inserts view context in environment. view context is live version of data
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
