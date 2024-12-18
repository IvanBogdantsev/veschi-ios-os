//  veschi-ios-os
//  Created by Ivan B.

import Appwrite
import Foundation

protocol DatabaseProtocol {
    func getItems<T: Codable>(
        of type: T.Type,
        from collection: AWCollection,
        queries: [String]
    ) async throws -> [T]
    
    func getItem<T: Codable>(
        of type: T.Type,
        from collection: AWCollection,
        id: String,
        queries: [String]
    ) async throws -> T
    
    func create(item: Codable, in collection: AWCollection, id: String) async throws
    func update(item: Codable, in collection: AWCollection, id: String) async throws
    func deleteItem(from collection: AWCollection, with id: String) async throws
}
// swiftlint:disable:next file_types_order
extension DatabaseProtocol {
    func getItems<T: Codable>(
        of type: T.Type,
        from collection: AWCollection,
        queries: [String] = []
    ) async throws -> [T] {
        return try await getItems(of: type, from: collection, queries: queries)
    }
    
    func getItem<T: Codable>(
        of type: T.Type,
        from collection: AWCollection,
        id: String,
        queries: [String]
    ) async throws -> T {
        return try await getItem(of: type, from: collection, id: id, queries: queries)
    }
}

enum AWCollection {
    case users
}

final class AWDatabase: AWClient, DatabaseProtocol {
    
    static let shared = AWDatabase()
    
    private lazy var databases: Databases = {
        Databases(client)
    }()
    
    func getItems<T: Codable>(
        of type: T.Type,
        from collection: AWCollection,
        queries: [String]
    ) async throws -> [T] {
        return try await databases.listDocuments(
            databaseId: AWConstants.databaseId,
            collectionId: collection.id,
            queries: queries,
            nestedType: T.self
        )
        .documents.map { $0.data }
    }
    
    func getItem<T: Codable>(
        of type: T.Type,
        from collection: AWCollection,
        id: String,
        queries: [String]
    ) async throws -> T {
        return try await databases.getDocument(
            databaseId: AWConstants.databaseId,
            collectionId: collection.id,
            documentId: id,
            queries: queries,
            nestedType: T.self
        )
        .data
    }
    
    func create(item: Codable, in collection: AWCollection, id: String = UUID().uuidString) async throws {
        _ = try await databases.createDocument(
            databaseId: AWConstants.databaseId,
            collectionId: collection.id,
            documentId: id,
            data: item.toJson()
        )
    }
    
    func update( item: Codable, in collection: AWCollection, id: String) async throws {
        _ = try await databases.updateDocument(
            databaseId: AWConstants.databaseId,
            collectionId: collection.id,
            documentId: id,
            data: item.toJson()
        )
    }
    
    func deleteItem(from collection: AWCollection, with id: String) async throws {
        _ = try await databases.deleteDocument(
            databaseId: AWConstants.databaseId,
            collectionId: collection.id,
            documentId: id
        )
    }
    
}
