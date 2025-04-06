//
//  AppetizerListCel.swift
//  Appetizers
//
//  Created by Mihai Cojocaru on 23/03/2025.
//

import SwiftUI

struct AppetizerListCel: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
//            AppetizersRemoteImage(urlString: appetizer.imageURL)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image("food-placeholder")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            }
            
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCel(appetizer: MockData.sampleAppetizer)
}
