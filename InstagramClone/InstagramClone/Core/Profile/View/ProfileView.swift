//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 07/04/2025.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    private let imageDimensions: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
            ScrollView {
                // header
                ProfileHeaderView(user: user)
                
                // post grid view
                PostGridView(user: user)
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
