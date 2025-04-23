//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 10/04/2025.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfile: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            // pic and stats
            HStack {
                CircularImageProfileView(user: user, size: .medium)
                
                Spacer()
                
                HStack {
                    UserStatView(value: 3, title: "Posts")
                    UserStatView(value: 1, title: "Followers")
                    UserStatView(value: 2, title: "Following")
                }
            }
            .padding(.horizontal)
            
            // name and bio
            VStack(alignment: .leading, spacing: 4) {
                Text("Chadwick Bozeman")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Wakanda Forever")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle( )
                } else {
                    
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(height: 32)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal)
            }
            
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
