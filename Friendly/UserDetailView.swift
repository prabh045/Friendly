//
//  FriendDetailView.swift
//  Friendly
//
//  Created by Prabhdeep Singh on 27/03/23.
//

import SwiftUI

struct UserDetailView: View {
    typealias UserDetail = FetchedResults<CachedUser>.Element
    var friend: UserDetail
    var body: some View {
        Form {
            Section("Contact Info") {
                Group {
                    Text(friend.userName)
                    Text(friend.userEmail)
                    Text(friend.userAddress)
                    Text("\(friend.age) and kickin :). Works at \(friend.userCompany)")
                }
                .foregroundColor(.brown)
            }
            Section("About") {
                Text(friend.userAddress)
               // Text("Registered: \(friend.registeredDate)")
            }
            Section("Friend List") {
                List(friend.friendsList, id: \.id) { friend in
                    Text(friend.friendName)
                }
            }
        }
        .navigationTitle(friend.userName)
        .navigationBarTitleDisplayMode(.inline)
    }
}


