//
//  SettingsRowView.swift
//  FirebaseAuth
//
//  Created by Mihai Cojocaru on 25/04/2025.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let titnleColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(titnleColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SettingsRowView(imageName: "gear", title: "Version", titnleColor: Color(.systemGray))
}
