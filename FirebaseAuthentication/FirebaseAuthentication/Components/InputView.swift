//
//  InputView.swift
//  FirebaseAuth
//
//  Created by Mihai Cojocaru on 23/04/2025.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
            
            Divider()
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "email@example.com")
}
