//
//  PostService.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 23/04/2025.
//

import Foundation
import Firebase

struct PostService {
    private static let postsCollectionRef = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postsCollectionRef.getDocuments()
        var posts = try snapshot.documents.compactMap({ document in
            let post = try document.data(as: Post.self)
            return post
        })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postsCollectionRef.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ document in
            let post = try document.data(as: Post.self)
            return post
        })
    }
}
