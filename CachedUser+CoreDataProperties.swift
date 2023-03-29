//
//  CachedUser+CoreDataProperties.swift
//  Friendly
//
//  Created by Prabhdeep Singh on 29/03/23.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var registered: Date?
    @NSManaged public var friends: NSSet?
    public var userId: String {
        return id ?? "id n/a"
    }
    public var userName: String {
        return name ?? "n/a"
    }
    public var userAge: Int {
        return Int(age)
    }
    public var userCompany: String {
        return company ?? "n/a"
    }
    public var userEmail: String {
        return email ?? "n/a"
    }
    public var userAddress: String {
        return address ?? "n/a"
    }
    public var userAbout: String {
        return about ?? "n/a"
    }
    public var userRegistered: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: registered ?? Date.now)
    }
    public var friendsList: [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []
        print("set is \(set)")
        return set.sorted { (first, second) in
            first.friendName < second.friendName
        }
    }

}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
