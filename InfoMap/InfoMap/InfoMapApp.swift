//
//  InfoMapApp.swift
//  InfoMap
//
//  Created by Mihai Cojocaru on 30/05/2025.
//

import SwiftUI

@main
struct InfoMapApp: App {
    @StateObject private var viewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
