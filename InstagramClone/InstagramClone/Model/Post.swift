//
//  Post.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 10/04/2025.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This test post caption 2",
            likes: 5, imageUrl: "black-panter-1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This test post caption 1",
            likes: 5, imageUrl: "black-panter-1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This test post caption 3",
            likes: 5, imageUrl: "black-panter-2",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[2]
        )
    ]
}
