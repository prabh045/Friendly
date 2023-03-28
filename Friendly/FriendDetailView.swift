//
//  FriendDetailView.swift
//  Friendly
//
//  Created by Prabhdeep Singh on 27/03/23.
//

import SwiftUI

struct FriendDetailView: View {
    typealias Friend = User
    var friend: Friend
    var body: some View {
        Form {
            Section("Contact Info") {
                Group {
                    Text(friend.name)
                    Text(friend.email)
                    Text(friend.address)
                    Text("\(friend.age) and kickin :). Works at \(friend.company)")
                }
                .foregroundColor(.brown)
            }
            Section("About") {
                Text(friend.about)
               // Text("Registered: \(friend.registeredDate)")
            }
            Section("Friend List") {
                List(friend.friends, id: \.id) { friend in
                    Text(friend.name)
                }
            }
        }
        .navigationTitle(friend.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


