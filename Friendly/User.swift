//
//  File.swift
//  Friendly
//
//  Created by Prabhdeep Singh on 27/03/23.
//

import Foundation

//class User: ObservableObject, Decodable {
//    @Published var users = [UserModel]()
//    enum CodingKeys: CodingKey {
//        case user
//    }
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.users = try container.decode([UserModel].self, forKey: .user)
//    }
//    init() {}
//}

struct User: Decodable {
    struct Friend: Decodable {
        let id: String
        let name: String
    }
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    var registeredDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: registered)
    }
}
