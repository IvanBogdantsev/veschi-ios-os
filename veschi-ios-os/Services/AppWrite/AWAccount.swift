//
//  UserAccount.swift
//  Let's Go
//
//  Created by Vanya Bogdantsev on 04.09.2023.
//

import Appwrite

final class AWAccount: AWClient {
    
    static let shared = AWAccount()
    
    private lazy var account: Account = {
        Account(client)
    }()
    
    func create(email: String,
                userID: String,
                name: String? = nil) async throws
    {
        let _ = try await account.create(
            userId: userID,
            email: email,
            password: userID,
            name: name
        )
    }
    
    func createEmailSession(email: String, password: String) async throws {
        let _ = try await account.createEmailPasswordSession(email: email, password: password)
    }
    
    func createAnonymousSession() async throws {
        let _ = try await account.createAnonymousSession()
    }
    
    func deleteSession() async throws {
        let _ = try await account.deleteSessions()
    }
    
}
