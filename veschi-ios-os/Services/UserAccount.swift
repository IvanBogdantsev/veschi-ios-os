//
//  UserAccount.swift
//  veschi-ios-os
//
//  Created by Vanya Bogdantsev on 23.10.2024.
//

import Appwrite

protocol UserAccountProtocol {
    func create(email: String, userID: String, name: String?) async throws
    func createSession(email: String, password: String) async throws -> Session
    func deleteSession() async throws
}

final class UserAccount: AWAccount, UserAccountProtocol {
    
    private let database: DatabaseProtocol
    
    init(database: DatabaseProtocol) {
        self.database = database
    }
    // TODO: should return user
    func create(
        email: String,
        userID: String,
        name: String? = nil
    ) async throws {
        _ = try await account.create(
            userId: userID,
            email: email,
            password: userID,
            name: name
        )
    }
    
    func createSession(email: String, password: String) async throws -> Session {
        return try await account.createEmailPasswordSession(email: email, password: password)
    }
    
    func deleteSession() async throws {
        _ = try await account.deleteSessions()
    }
    
}
