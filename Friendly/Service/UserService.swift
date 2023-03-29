//
//  UserService.swift
//  Friendly
//
//  Created by Prabhdeep Singh on 27/03/23.
//

import Foundation

enum ServiceError: Error {
    case invalidUrl
    case noData
    case decodeError
}
//MARK: Non generic
class UserService {
    func fetchUsers(urlString: String) async -> Result<[User], ServiceError> {
        guard let url = URL(string: urlString) else {
            print("Invalid url")
            return .failure(.invalidUrl)
        }
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {
            return .failure(.noData)
        }
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let user = try decoder.decode([User].self, from: data)
            return .success(user)
        } catch(let error) {
            print("error in decoding data \(error.localizedDescription)")
            return .failure(.decodeError)
        }
    }
}
//MARK: Generic Version
class UserServiceGeneric<T: Decodable> {
    func fetchUsers(urlString: String) async -> Result<[T], ServiceError> {
        guard let url = URL(string: urlString) else {
            print("Invalid url")
            return .failure(.invalidUrl)
        }
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {
            return .failure(.noData)
        }
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let user = try decoder.decode([T].self, from: data)
            return .success(user)
        } catch(let error) {
            print("error in decoding data \(error.localizedDescription)")
            return .failure(.decodeError)
        }
    }
}
