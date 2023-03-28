//
//  ContentView.swift
//  Friendly
//
//  Created by Prabhdeep Singh on 27/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink {
                    FriendDetailView(friend: user)
                } label: {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                            Text(user.name)
                            Spacer()
                            user.isActive ?
                            Circle()
                                .fill(Color.green)
                                .frame(width: 8, height: 8)
                                .padding(.trailing) : nil
                            
                        }
                        Text("Joined: \(user.registeredDate)")
                            .font(.subheadline)
                            .foregroundColor(.gray.opacity(0.75))
                    }
                }
            }
            .navigationTitle("F.R.I.E.N.D.S")
            .padding(.bottom)
        }
        .task {
            print("Ran task")
            if users.isEmpty == false {
                return
            }
            let result = await UserServiceGeneric<User>().fetchUsers(urlString: "https://www.hackingwithswift.com/samples/friendface.json")
            switch result {
            case .success(let user):
                print("user is \(user)")
                users = user
            case .failure(let error):
                print("error is \(error.localizedDescription)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
