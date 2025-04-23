//
//  TextFieldModifier.swift
//  InstagramClone
//
//  Created by Mihai Cojocaru on 10/04/2025.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
