//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Mihai Cojocaru on 23/03/2025.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let cache = NSCache<NSString,UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
       
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
//    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
//        // check for good URL
//        guard let url = URL(string: appetizerURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        // create network call to make request with good url it'll return to data, response, and error
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            // check for error i.e. lost wifi
//            if let _ = error {
//                completed(.failure(.unableToComplete))
//                return
//            }
//            
//            // cast the response as a HTTPURLResponse and check status code make sure it's 200
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            // check for data
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//            
//            // decode data into the model
//            do {
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                completed(.success(decodedResponse.request))
//            } catch {
//                completed(.failure(.invalidData))
//            }
//        }
//        
//        task.resume()
//    }
//  }
    
    func getAppetizers() async throws -> [Appetizer] {
        // check for good URL
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        // create network call to make request with good url it'll return to data, response, and error
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // cast the response as a HTTPURLResponse and check status code make sure it's 200
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APError.invalidResponse
        }
        
        // decode data into the model
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponse.request
        } catch {
            throw APError.invalidData
        }
    }
    
    func downloadImage(fromUrlString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
