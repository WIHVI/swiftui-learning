//
//  LoginView.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 08/04/2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationStack {
            Spacer()
            
            // logo image
            Text("Instagram")
                .font(.largeTitle)
                .fontWeight(.bold)
               
            // text fields
            VStack {
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(TextFieldModifier())
                
                SecureField("Password", text: $viewModel.password)
                    .modifier(TextFieldModifier())
                
                Button {
                    
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button {
                    Task { try await viewModel.signIn() }
                } label: {
                    Text("Log In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 48, height: 44)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding(.top)
            
            Spacer()
            
            Divider()
            
            NavigationLink {
                AddEmailView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Don't have an account? Sign Up")
                    
            }
            .font(.footnote)
            .fontWeight(.semibold)
            .padding(.top)
        }
    }
}

#Preview {
    LoginView()
}
