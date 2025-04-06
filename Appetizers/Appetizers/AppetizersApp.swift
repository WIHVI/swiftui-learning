//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Mihai Cojocaru on 23/03/2025.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizersTabView().environmentObject(order)
        }
    }
}
