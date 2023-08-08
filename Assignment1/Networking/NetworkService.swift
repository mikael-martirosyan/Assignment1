//
//  NetworkService.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 04.08.2023.
//

import Foundation

final class NetworkService {
    
    // MARK: - Properties
    static var shared = NetworkService()

    
    // MARK: - Initializer
    private init() {}
    
    
    // MARK: - Functions
    
    /// Fetches data with spicified values.
    ///
    /// If the data isn't valid, this method throws the following errors:
    ///  - `NetworkErrors.invalidStatusCode`
    ///  - `NetworkErrors.decodingError`
    ///
    /// - Parameters:
    ///   - page: Page number.
    ///   - usersLimit: Count of users per page.
    /// - Returns: An array of users.
    func fetchData(page: Int, usersLimit: Int) async throws -> [User] {
        let url: URL = try urlMaker(page, usersLimit)
        
        let (data, urlResponse) = try await URLSession.shared.data(from: url)
        
        guard let httpURLRespone = urlResponse as? HTTPURLResponse,
              httpURLRespone.statusCode >= 200,
              httpURLRespone.statusCode < 300
        else {
            throw NetworkErrors.invalidStatusCode
        }
        
        do {
            let decodedResponse: Response = try JSONDecoder().decode(Response.self, from: data)
            let results: [User] = decodedResponse.results
            return results
        }
        catch {
            throw NetworkErrors.decodingError
        }
    }
    
    /// Creates an url with specified query items
    ///
    /// - Throws: If the data isn't valid, this method throws the `NetworkErrors.invalidURL` error.
    /// - Parameters:
    ///   - page: Page number.
    ///   - usersLimit: Count of users per page.
    /// - Returns: A new url.
    private func urlMaker(_ page: Int, _ usersLimit: Int) throws -> URL {
        var urlComponents: URLComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "randomuser.me"
        urlComponents.path = "/api/"
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "results", value: String(usersLimit))
        ]
        
        guard let url: URL = urlComponents.url else {
            throw NetworkErrors.invalidURL
        }
        
        return url
    }
}
