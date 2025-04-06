//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Mihai Cojocaru on 27/03/2025.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetails: Bool = false
    @Published var selectedAppetizer: Appetizer?
    
//    func getAppetizers() {
//        self.isLoading = true
//        
//        NetworkManager.shared.getAppetizers { result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result {
//                    case .success(let appetizers):
//                        self.appetizers = appetizers
//                    case .failure(let error):
//                        switch error {
//                            case .invalidResponse:
//                                self.alertItem = AlertContext.invalidResponse
//                            case .invalidURL:
//                                self.alertItem = AlertContext.invalidURL
//                            case .invalidData:
//                                self.alertItem = AlertContext.invalidData
//                            case .unableToComplete:
//                                self.alertItem = AlertContext.unableToComplete
//                        }
//                }
//            }
//        }
//    }
    
    func getAppetizers() {
        self.isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                self.isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                
                self.isLoading = false
            }
        }
    }
}
