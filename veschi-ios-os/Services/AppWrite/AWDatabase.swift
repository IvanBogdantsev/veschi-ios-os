//
//  Databases.swift
//  Let's Go
//
//  Created by Vanya Bogdantsev on 23.09.2023.
//

import Appwrite
import Foundation

protocol DatabaseProtocol {
    func getItems<T: Codable>(_ type: T.Type, from collection: AWCollection, queries: [String]?) async throws -> [T]
    func getItem<T: Codable>(_ type: T.Type, from collection: AWCollection, id: String, queries: [String]?) async throws -> T
    func createItem(_ item: Codable, in collection: AWCollection, id: String) async throws
    func updateItem(_ item: Codable, in collection: AWCollection, id: String) async throws
    func deleteItem(from collection: AWCollection, id: String) async throws
}

enum AWCollection {
    case users
}

final class AWDatabase: AWClient, DatabaseProtocol {
    
    static let shared = AWDatabase()
    
    private lazy var databases: Databases = {
        Databases(client)
    }()
    
    func getItems<T: Codable>(_ type: T.Type,
                              from collection: AWCollection,
                              queries: [String]? = nil) async throws -> [T]
    {
        return try await databases.listDocuments(databaseId: AWConstants.databaseId,
                                                 collectionId: collection.id,
                                                 queries: queries,
                                                 nestedType: T.self).documents.map { $0.data }
    }
    
    func getItem<T: Codable>(_ type: T.Type,
                             from collection: AWCollection,
                             id: String,
                             queries: [String]? = nil) async throws -> T
    {
        return try await databases.getDocument(databaseId: AWConstants.databaseId, collectionId: collection.id, documentId: id, queries: queries, nestedType: T.self).data
    }
    
    func createItem(_ item: Codable,
                    in collection: AWCollection,
                    id: String = UUID().uuidString) async throws
    {
        _ = try await databases.createDocument(databaseId: AWConstants.databaseId,
                                               collectionId: collection.id,
                                               documentId: id,
                                               data: item.toJson())
    }
    
    func updateItem(_ item: Codable,
                    in collection: AWCollection,
                    id: String) async throws
    {
        _ = try await databases.updateDocument(databaseId: AWConstants.databaseId,
                                               collectionId: collection.id,
                                               documentId: id,
                                               data: item.toJson())
    }
    
    func deleteItem(from collection: AWCollection,
                    id: String) async throws
    {
        _ = try await databases.deleteDocument(databaseId: AWConstants.databaseId,
                                               collectionId: collection.id,
                                               documentId: id)
    }
    
}
