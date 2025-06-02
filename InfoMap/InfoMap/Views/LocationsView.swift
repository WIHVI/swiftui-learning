//
//  LocationView.swift
//  InfoMap
//
//  Created by Mihai Cojocaru on 31/05/2025.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    let maxWidthForIpad: CGFloat = 700
    
    var body: some View {
        ZStack {
            Map(position: $viewModel.position)
                .ignoresSafeArea()
            
            VStack {
                header
                .padding()
                .frame(maxWidth: maxWidthForIpad)
                
                Spacer()
                
                ZStack {
                    ForEach(viewModel.locations) { location in
                        if viewModel.mapLocation == location {
                            LocationPreviewView(location: location)
                            .shadow(radius: 20, x: 0, y: 15)
                            .padding()
                            .frame(maxWidth: maxWidthForIpad)
                            .frame(maxWidth: .infinity)
                            .transition(
                                .asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)
                                )
                            )
                        }
                    }
                }
            }
        }
        .sheet(item: $viewModel.sheetLocation) { location in
            LocationDetailView(location: location)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: viewModel.toggleLocationList) {
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: viewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: viewModel.showLocationList ? 180 : 0))
                    }
            }
            
            if viewModel.showLocationList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(radius: 20, x: 0, y: 15)
    }
}
