//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 08/04/2025.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        // image + user name
        HStack {
            if let user = post.user {
                CircularImageProfileView(user: user, size: .xSmall)
                
                Text(user.userName)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            
            Spacer()
        }
        .padding(.leading, 8)
        
        // post image
        KFImage(URL(string: post.imageUrl))
            .resizable()
            .scaledToFill()
            .frame(height: 400)
            .clipShape(Rectangle())
        
        // actions buttons
        HStack(spacing: 16) {
            Button {
                
            } label: {
                Image(systemName: "heart")
                    .imageScale(.large)
            }
            
            Button {
                
            } label: {
                Image(systemName: "bubble.right")
                    .imageScale(.large)
            }
            
            Button {
                
            } label: {
                Image(systemName: "paperplane")
                    .imageScale(.large)
                    
            }

            Spacer()
        }
        .padding(.leading, 8)
        .padding(.top, 4)
        .foregroundColor(.black)
        
        // likes label
        Text("\(post.likes)")
            .font(.footnote)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
        
        // caption label
        HStack {
            Text("\(post.user?.userName ?? "")").fontWeight(.semibold) +
            Text("  \(post.caption)")
        }
        .font(.footnote)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 10)
        .padding(.top, 1)
        
        // timestamp label
        Text("5h")
            .font(.footnote)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            .foregroundColor(.gray)
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[0])
}
