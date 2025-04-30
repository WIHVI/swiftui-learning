//
//  ProfileView.swift
//  FirebaseAuth
//
//  Created by Mihai Cojocaru on 25/04/2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text(viewModel.currentUser?.initials ?? "")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(viewModel.currentUser?.fullName ?? "")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        Text(viewModel.currentUser?.email ?? "")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Section("General") {
                HStack {
                    SettingsRowView(
                        imageName: "gear",
                        title: "Version",
                        titnleColor: Color.gray
                    )
                    
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
            }
            
            Section("Account") {
                Button {
                    viewModel.signOut()
                } label: {
                    SettingsRowView(
                        imageName: "arrow.left.circle.fill",
                        title: "Sign Out",
                        titnleColor: Color.red
                    )
                }
                
                Button {
                    Task { try await viewModel.deleteAccount() }
                } label: {
                    SettingsRowView(
                        imageName: "xmark.circle.fill",
                        title: "Delete Account",
                        titnleColor: Color.red
                    )
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
