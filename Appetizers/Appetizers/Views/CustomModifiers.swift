//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Mihai Cojocaru on 02/04/2025.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

//extension View {
//    func standardButtonStyle() -> some View {
//        modifier(StandardButtonStyle())
//    }
//}
