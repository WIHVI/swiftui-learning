//
//  SearchView.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 08/04/2025.
//

import SwiftUI

struct SearchView: View {
    @State private var serachText: String = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                CircularImageProfileView(user: user, size: .xSmall)
                                
                                VStack(alignment: .leading) {
                                    Text(user.userName)
                                        .fontWeight(.semibold)
                                    
                                    if let fullName = user.fullName {
                                        Text(fullName)
                                    }
                                    
                                }
                                .font(.footnote)
                                
                                Spacer()
                            }
                            .foregroundColor(.black)
                            .padding(.leading)
                        }
                    }
                    .padding(.top, 8)
                    .searchable(text: $serachText, prompt: "Search...")
                }
                .navigationDestination(for: User.self, destination: { user in
                    ProfileView(user: user)
                })
                .navigationTitle("Explore")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    SearchView()
}
