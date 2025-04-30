//
//  LoginView.swift
//  FirebaseAuth
//
//  Created by Mihai Cojocaru on 23/04/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                // image
                Image("firebase-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)
                
                // form fields
                VStack(spacing: 24) {
                    InputView(
                        text: $email,
                        title: "Email",
                        placeholder: "Enter your email"
                    )
                    
                    InputView(
                        text: $password,
                        title: "Password",
                        placeholder: "Enter your password",
                        isSecureField: true
                    )
                }
                .padding(.horizontal, 20)
                .padding(.top)
                
                // sign in button
                Button {
                    if formValid {
                        Task {
                            try await viewModel.signIn(
                                email: email,
                                password: password
                            )
                        }
                    }
                } label: {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(
                            width: UIScreen.main.bounds.width - 40,
                            height: 48
                        )
                }
                .background(Color.blue)
                .disabled(!formValid)
                .opacity(formValid ? 1 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                // sign up button
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formValid: Bool {
        return email.contains("@")
        && password.count > 7
        && !email.isEmpty
        && !password.isEmpty
    }
}

#Preview {
    LoginView()
}
