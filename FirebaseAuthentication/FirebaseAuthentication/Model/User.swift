//
//  User.swift
//  FirebaseAuth
//
//  Created by Mihai Cojocaru on 25/04/2025.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let email: String
    let fullName: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}

extension User {
    static var MOCK_USER: User {
        .init(
            id: NSUUID().uuidString,
            email: "test@test.com",
            fullName: "Test User"
        )
    }
}
