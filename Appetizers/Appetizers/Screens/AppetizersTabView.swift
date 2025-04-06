//
//  ContentView.swift
//  Appetizers
//
//  Created by Mihai Cojocaru on 23/03/2025.
//

import SwiftUI

struct AppetizersTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView{
            AppetizersListView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem{
                    Label("Account", systemImage: "person.crop.circle")
                }
            
            OrderView()
                .tabItem{
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
    }
}

#Preview {
    AppetizersTabView().environmentObject(Order())
}
