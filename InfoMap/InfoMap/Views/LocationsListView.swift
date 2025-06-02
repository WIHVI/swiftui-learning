//
//  LocationsListView.swift
//  InfoMap
//
//  Created by Mihai Cojocaru on 31/05/2025.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button(action: {
                    viewModel.showNextLocation(for: location)
                }, label: {
                    listRowView(location)
                })
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}

extension LocationsListView {
    private func listRowView(_ location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
