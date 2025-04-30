//
//  AuthViewModel.swift
//  FirebaseAuth
//
//  Created by Mihai Cojocaru on 28/04/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol AuthenticationFormProtocol {
    var formValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task { await fetchUserData() }
    }
    
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            
            await fetchUserData()
        } catch {
            print("DEBUG: Error signing in: \(error.localizedDescription)")
        }
    }
    
    func createUser(email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, email: email, fullName: fullName)
            
            guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            
            await fetchUserData()
        } catch {
            print("DEBUG: Error creating user: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Error signing out: \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() async throws {
        do {
            try await Auth.auth().currentUser?.delete()
            try await Firestore.firestore().collection("users").document(self.currentUser!.id).delete()
            self.currentUser = nil
            self.userSession = nil
        } catch {
            print("DEBUG: Error deleting account: \(error.localizedDescription)")
        }
    }
    
    func fetchUserData() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        
        self.currentUser = try? snapshot.data(as: User.self)
    }
}
