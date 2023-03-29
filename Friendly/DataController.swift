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
//public var userId: String {
//    return id ?? "id n/a"
//}
//public var userName: String {
//    return name ?? "n/a"
//}
//public var userAge: Int {
//    return Int(age ?? -1)
//}
//public var userCompany: String {
//    return company ?? "n/a"
//}
//public var userEmail: String {
//    return email ?? "n/a"
//}
//public var userAddress: String {
//    return address ?? "n/a"
//}
//public var userAbout: String {
//    return about ?? "n/a"
//}
//public var userRegistered: String {
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "dd MMM yyyy"
//    return dateFormatter.string(from: registered ?? Date.now)
//}
//

//    public var friendsList: [CachedFriend] {
//var set = friends as? Set<CachedFriend> ?? []
//print("set is \(set)")
//return set.sorted { first, second in
//    first.friendName < second.friendName
//}
//}


//public var friendId: String {
//    return id ?? "n/a"
//}
//public var friendName: String {
//    return name ?? "n/a"
//}
