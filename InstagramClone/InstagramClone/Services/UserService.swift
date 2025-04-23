//
//  UserService.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 16/04/2025.
//

import Foundation
import Firebase

struct UserService {
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        
        return try snapshot.data(as: User.self)
    }
    
    static func fetchAllUsers() async throws -> [User] {
//        var users: [User] = []
//        
//        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
//        let documents = snapshot.documents
//        
//        for document in documents {
//            guard let user = try? document.data(as: User.self) else { return users }
//            
//            users.append(user)
//        }
//        
//        return users
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap { document in
            try? document.data(as: User.self)
        }
    }
}
