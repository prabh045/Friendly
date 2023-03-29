//
//  ContentView.swift
//  Friendly
//
//  Created by Prabhdeep Singh on 27/03/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var objectContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var cachedUsers: FetchedResults<CachedUser>
    //private var users = [User]()
    var body: some View {
        NavigationView {
            List(cachedUsers, id: \.id) { user in
                NavigationLink {
                    UserDetailView(friend: user)
                } label: {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(user.userName)
                            .font(.system(size: 16))
                        Text("Registered: \(user.userRegistered)")
                            .foregroundColor(.gray.opacity(0.75))
                            .font(.system(size: 12))
                        user.isActive ?
                        Text("Online")
                            .foregroundColor(Color.green)
                            .font(.system(size: 10))
                        : nil
                    }
                    .padding(.top, 5)
                }
            }
            .navigationTitle("F.R.I.E.N.D.S")
            .padding(.bottom)
        }
        .task {
            print("Ran task")
            if cachedUsers.isEmpty {
                let userList = await getUsers()
                print("gotton users, now saving")
                await MainActor.run {
                    saveUsers(userList: userList)
                }
            }
        }
    }
    private func getUsers() async -> [User] {
        let result = await UserServiceGeneric<User>().fetchUsers(urlString: "https://www.hackingwithswift.com/samples/friendface.json")
        switch result {
        case .success(let user):
            //print("user is \(user)")
           // saveUsers(userList: user)
            return user
        case .failure(let error):
            print("error is \(error.localizedDescription)")
            return []
        }
    }
    private func saveUsers(userList: [User]) {
        if userList.isEmpty {
            print("cannot save empty list")
            return
        }
        for user in userList {
            let cachedUser = CachedUser(context: objectContext)
            cachedUser.name = user.name
            cachedUser.company = user.company
            cachedUser.isActive = user.isActive
            cachedUser.id = user.id
            cachedUser.registered = user.registered
            cachedUser.about = user.about
            cachedUser.address = user.address
            cachedUser.email = user.email
            cachedUser.age = Int16(user.age)
            for friend in user.friends {
                let cachedFriend = CachedFriend(context: objectContext)
                cachedFriend.id = friend.id
                cachedFriend.name = friend.name
                cachedUser.addToFriends(cachedFriend)
            }
        }
        do {
            try objectContext.save()
            print("Users Saved")
        } catch(let error) {
            print("eror in saving Users \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
