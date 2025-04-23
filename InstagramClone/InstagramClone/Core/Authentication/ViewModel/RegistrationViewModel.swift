//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 13/04/2025.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signUp() async throws {
        try await AuthService.shared.signUp(withEmail: email, password: password, userName: userName)
        
        userName = ""
        email = ""
        password = ""
    }
}
