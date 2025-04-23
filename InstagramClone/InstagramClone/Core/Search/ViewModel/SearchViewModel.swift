//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 16/04/2025.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        let users = try await UserService.fetchAllUsers()
        self.users = users
    }
}
