//
//  NetworkService.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 11.08.2023.
//

import Combine
import Foundation

final class NetworkService {
    
    // MARK: - Properties
    static var shared = NetworkService()

    
    // MARK: - Initializer
    private init() {}
    
    
    // MARK: - Functions
    
    /// Fetches a data with spicified values.
    ///
    /// If the data isn't valid, this method throws the following errors:
    ///  - `NetworkErrors.invalidStatusCode`
    ///  - `NetworkErrors.decodingError`
    ///
    /// - Parameters:
    ///   - page: Page number.
    ///   - usersLimit: Count of users per page.
    /// - Returns: An array of users.
    func fetchData(page: Int, usersLimit: Int) -> AnyPublisher<[User], Error> {
        do {
            let url: URL = try urlMaker(page, usersLimit)
            
            return URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { data, response in
                    guard let httpURLRespone = response as? HTTPURLResponse,
                          httpURLRespone.statusCode >= 200,
                          httpURLRespone.statusCode < 300
                    else {
                        throw NetworkErrors.invalidStatusCode
                    }
                    return data
                }
                .decode(type: Response.self, decoder: JSONDecoder())
                .map(\.results)
                .eraseToAnyPublisher()
            
        } catch {
            return Fail(error: error)
                .eraseToAnyPublisher()
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
