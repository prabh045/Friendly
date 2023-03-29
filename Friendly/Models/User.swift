//
//  File.swift
//  Friendly
//
//  Created by Prabhdeep Singh on 27/03/23.
//

import Foundation

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
}
