//
//  ContentView.swift
//  FirebaseAuthentication
//
//  Created by Mihai Cojocaru on 28/04/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView().environmentObject(AuthViewModel())
}
