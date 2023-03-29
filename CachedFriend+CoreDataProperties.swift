//
//  CachedFriend+CoreDataProperties.swift
//  Friendly
//
//  Created by Prabhdeep Singh on 29/03/23.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?
    public var friendId: String {
        return id ?? "n/a"
    }
    public var friendName: String {
        return name ?? "n/a"
    }

}

extension CachedFriend : Identifiable {

}
