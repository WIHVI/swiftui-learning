//
//  FeedView.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 08/04/2025.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Instagram")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
