//
//  LocationViewModel.swift
//  InfoMap
//
//  Created by Mihai Cojocaru on 31/05/2025.
//

import Foundation
import _MapKit_SwiftUI
import SwiftUI

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet {
            updatePosition(for: mapLocation)
        }
    }
    @Published var position: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion())
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationList: Bool = false
    
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        updatePosition(for: locations.first!)
    }
    
    func updatePosition(for location: Location) {
        withAnimation(.easeInOut) {
            self.position = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span: mapSpan
                )
            )
        }
    }
    
    func toggleLocationList() {
        withAnimation(.easeInOut) {
            self.showLocationList.toggle()
        }
    }
    
    func showNextLocation(for location: Location) {
        withAnimation(.easeInOut) {
            self.mapLocation = location
            self.showLocationList = false
        }
    }
    
    func nextButtonPressed() {
        if let index = locations.firstIndex(of: mapLocation) {
            let nextIndex = (index + 1) % locations.count
            showNextLocation(for: locations[nextIndex])
        }
        
//        guard let currentIndex = locations.firstIndex(where: { location in
//            location == mapLocation
//        }) else { return }
//        
//        let nextIndex = currentIndex + 1
//        
//        guard locations.indices.contains(nextIndex) else {
//            guard let firstLocation = locations.first else { return }
//            showNextLocation(for: firstLocation)
//            return
//        }
//        
//        let nextLocation = locations[nextIndex]
//        showNextLocation(for: nextLocation)
    }
}
