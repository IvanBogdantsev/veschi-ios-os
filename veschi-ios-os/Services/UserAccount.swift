//
//  UserAccount.swift
//  Let's Go
//
//  Created by Vanya Bogdantsev on 04.09.2023.
//

import Appwrite
import UIKit

fileprivate enum LoginError: Error {
    case unableToLogin(String)
    case unableToDeleteSession(String)
}

final class UserAccount: AWClient {
    
    static let shared = UserAccount()
    
    private(set) lazy var account: Account = {
        Account(client)
    }()
    
    private lazy var functions: Functions = {
        Functions(client)
    }()
    
    private lazy var databases: Appwrite.Databases = {
        Appwrite.Databases(client)
    }()
    
    private override init() {
        super.init()
    }
    
    func createMark(_ model: CreatePlacemarkModel) async {
        do {
            let _ = try await databases.createDocument(databaseId: "63e2b4503fa1bf5d1a5f", collectionId: "63e2b456b185a4c53116", documentId: UUID().uuidString, data: model.toJson())
        } catch {
            print(error)
        }
    }
    
    func loadPhoto(_ photo: UIImage) async throws -> PhotoUrlResponse? {
        do {
            if let compressedImage = photo.jpegData(compressionQuality: 0.3) {
                let account = try await account.get()
                let body = await UploadPhotoBodyModel(
                    path: "\(account.id).jpg",
                    file:  compressedImage.base64EncodedString(),
                    jwt: try self.account.createJWT().jwt
                )
                
                let response = try await functions.createExecution(functionId: "656f724e8411fd8b6395", body: body.toJson())
                return try (response.responseBody.cleanJSON() ?? "").fromJson(to: PhotoUrlResponse.self)
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func getTags() async -> [TagModel] {
        do {
            let response = try await databases.listDocuments(databaseId: "63e2b4503fa1bf5d1a5f", collectionId: "64d48108cfdf0b6763dc")
            return response.documents.map { TagModel(id: $0.id, description: ($0.data["description"]?.value as? String ?? "no value")) }
        } catch {
            print(error)
        }
        return []
    }
    
    func updateUser(user: User) async throws  -> User? {
        do {
            let bodyData = UserUpdateModel(user: user)
            let _  = try await databases.updateDocument(databaseId: "63e2b4503fa1bf5d1a5f", collectionId: "646d0d2149f236a62413", documentId: user.id, data: bodyData.toJson())
        } catch {
            print(error)
        }
        return nil
    }
    
    func getUser() async throws  -> User? {
        do {
            let account = try await account.get()
            let response = try await databases.getDocument(databaseId: "63e2b4503fa1bf5d1a5f", collectionId: "646d0d2149f236a62413", documentId: account.id)
            return try response.data.toJson().fromJson(to: User.self)
        } catch {
            print(error)
        }
        return nil
    }
    
    func confirmCode(_ code: String) async throws -> ConfirmCodeResponseModel {
        let body = await ConfirmCodeModel(jwt: try account.createJWT().jwt, code: code)
        let response = try await functions.createExecution(functionId: "654572cb117c272cb82f", body: body.toJson())
        return try response.responseBody.fromJson(to: ConfirmCodeResponseModel.self)
        
    }
    
    func inputPhone() async throws {
        let body = await InputPhoneModel(jwt: try account.createJWT().jwt)
        let _ = try await functions.createExecution(functionId: "6544f38254bc65fa3145", body: body.toJson())
    }
    
    func createAccount(email: String, userID: String, name: String? = nil) async throws {
        let _ = try await account.create(
            userId: userID,
            email: email,
            password: userID,
            name: name
        )
    }
    
    func createEmailSession(email: String, password: String) async throws {
        let _ = try await account.createEmailSession(email: email, password: password)
    }
    
    func createAnonymousSession() async throws {
        let _ = try await account.createAnonymousSession()
    }
    
    func login() async throws {
        let account = try await account.get()
        if account.emailVerification { throw LoginError.unableToLogin("") }
    }
    
    func deleteSession() async throws {
        let _ = try await account.deleteSessions()
    }
    
}
