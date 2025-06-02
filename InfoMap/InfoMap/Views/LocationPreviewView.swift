//
//  LocationPreviewView.swift
//  InfoMap
//
//  Created by Mihai Cojocaru on 31/05/2025.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                
                titleSection
            }
            
            VStack(spacing: 8) {
                Button {
                    viewModel.sheetLocation = location
                } label: {
                    Text("Learn more")
                        .font(.headline)
                        .frame(width: 120, height: 40)
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    viewModel.nextButtonPressed()
                } label: {
                    Text("Next")
                        .font(.headline)
                        .frame(width: 120, height: 40)
                }
            }
        }
        .padding(20)
        .buttonStyle(.bordered)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 50)
        )
        .cornerRadius(10)
    }
}

#Preview {
    ZStack {
        Color.blue.edgesIgnoringSafeArea(.all)
        LocationPreviewView(location: LocationsDataService.locations.first!)
    }
    .environmentObject(LocationsViewModel())
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(4)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
