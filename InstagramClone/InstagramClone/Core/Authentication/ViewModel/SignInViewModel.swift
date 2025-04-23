//
//  SignInViewModel.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 16/04/2025.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn() async throws {
        try await AuthService.shared.signIn(withEmail: email, password: password)
    }
}
