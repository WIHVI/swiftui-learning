//
//  CircularImageProfileView.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 19/04/2025.
//

import SwiftUI
import Kingfisher

enum ProfileSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 50
        case .medium:
            return 80
        case .large:
            return 120
        }
    }
}

struct CircularImageProfileView: View {
    let user: User
    let size: ProfileSize
    
    var body: some View {
        if let imageUrl = user.profilePictureUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircularImageProfileView(user: User.MOCK_USERS[0], size: .medium)
}
