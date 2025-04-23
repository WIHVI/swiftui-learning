//
//  AuthService.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 13/04/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init() {
//        self.userSession = Auth.auth().currentUser
        
        Task { try await loadUserData() }
    }
    
    @MainActor
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("Error signing in: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func signUp(withEmail email: String, password: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserDate(uid: result.user.uid, userName: userName, email: email)
        } catch {
            print("Error signing up: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        
//        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        guard let currentUid = self.userSession?.uid else { return }
        
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
    }
    
    func signOut() async {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    func uploadUserDate(uid: String, userName: String, email: String) async {
        let user = User(id: uid, userName: userName, email: email)
        self.currentUser = user
        guard let endodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(endodedUser)
    }
}
