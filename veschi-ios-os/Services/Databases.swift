//
//  Databases.swift
//  Let's Go
//
//  Created by Vanya Bogdantsev on 23.09.2023.
//

import Appwrite
import Foundation
import AppwriteModels

enum Collection {
    case marks
    case registrations
    case users
    case cities
    case subcategories
    case messages
    case lastMessages
    
    fileprivate var id: String {
        switch self {
        case .marks:
            AWConstants.marksСollectionId
        case .registrations:
            AWConstants.registrationsCollectionId
        case .users:
            AWConstants.usersCollectionId
        case .cities:
            AWConstants.citiesCollectionId
        case .subcategories:
            AWConstants.subcategoriesCollectionId
        case .messages:
            AWConstants.messagesCollectionId
        case .lastMessages:
            AWConstants.lastMessagesCollectionId
        }
    }
}

final class Databases: AWClient {
    
    static let shared = Databases()
    
    private lazy var databases: Appwrite.Databases = {
        Appwrite.Databases(client)
    }()
    
    private override init() {
        super.init()
    }
    
    func getItems<T: Codable>(_ type: T.Type, from collection: Collection, queries: [String]? = nil) async throws -> [T] {
        return try await databases.listDocuments(databaseId: AWConstants.databaseId, collectionId: collection.id, queries: queries, nestedType: T.self).documents.map { $0.data }
    }
    
    func getItem<T: Codable>(_ type: T.Type, from collection: Collection, itemId: String, queries: [String]? = nil) async throws -> T {
        return try await databases.getDocument(databaseId: AWConstants.databaseId, collectionId: collection.id, documentId: itemId, queries: queries, nestedType: T.self).data
    }
    
    func createItem<T: Codable>(_ type: T.Type, from collection: Collection, data: String, id: String = UUID().uuidString) async throws   {
        _ = try await databases.createDocument(databaseId: AWConstants.databaseId, collectionId: collection.id, documentId: id, data: data)
        
    }
    
    func updateItem<T: Codable>(_ type: T.Type, from collection: Collection, data: String, id: String) async throws   {
        _ = try await databases.updateDocument(databaseId: AWConstants.databaseId, collectionId: collection.id, documentId: id, data: data)
        
    }
    
}

