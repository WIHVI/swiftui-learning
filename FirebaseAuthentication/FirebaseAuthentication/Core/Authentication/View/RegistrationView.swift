//
//  RegistrationView.swift
//  FirebaseAuth
//
//  Created by Mihai Cojocaru on 23/04/2025.
//

import SwiftUI

struct RegistrationView: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
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
                    text: $fullName,
                    title: "Full Name",
                    placeholder: "Enter your full name"
                )
                .autocapitalization(.none)
                
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
                
                InputView(
                    text: $confirmPassword,
                    title: "Password",
                    placeholder: "Confirm your password",
                    isSecureField: true
                )
            }
            .padding(.horizontal, 20)
            .padding(.top)
            
            // sign up button
            Button {
                if formValid {
                    Task {
                        try await viewModel.createUser(
                            email: email,
                            password: password,
                            fullName: fullName
                        )
                    }
                }
            } label: {
                Text("Sign Up")
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
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .font(.system(size: 14))
            }
        }
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formValid: Bool {
        return email.contains("@")
        && password.count > 7
        && !email.isEmpty
        && !password.isEmpty
        && !fullName.isEmpty
        && confirmPassword == password
    }
}


#Preview {
    RegistrationView()
}
