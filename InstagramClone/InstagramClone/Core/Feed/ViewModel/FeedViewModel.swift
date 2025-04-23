//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 23/04/2025.
//

import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        Task { try await self.fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
