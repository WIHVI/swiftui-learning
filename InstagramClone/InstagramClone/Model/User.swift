//
//  User.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 10/04/2025.
//

import Foundation
import FirebaseAuth

struct User: Identifiable, Hashable, Codable {
    let id: String
    var userName: String
    var profilePictureUrl: String?
    var fullName: String?
    var bio: String?
    var email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return id == currentUid
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        User(
            id: NSUUID().uuidString,
            userName: "mockUser1",
            profilePictureUrl: "black-panter-1",
            fullName: "Mock User 1",
            bio: "Just a mock user",
            email: "mockUser1@example.com"
        ),
        .init(
            id: NSUUID().uuidString,
            userName: "mockUser2",
            profilePictureUrl: "black-panter-1",
            fullName: "Mock User 2",
            bio: "Just a mock user",
            email: "mockUser2@example.com"
        ),
        .init(
            id: NSUUID().uuidString,
            userName: "mockUser3",
            profilePictureUrl: "black-panter-1",
            fullName: "Mock User 3",
            bio: "Just a mock user",
            email: "mockUser3@example.com"
        )
    ]
}
