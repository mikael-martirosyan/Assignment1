//
//  NetworkErrors.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 08.08.2023.
//

import Foundation

enum NetworkErrors: Error {
    case decodingError
    case invalidStatusCode
    case invalidURL
    
    var description: String {
        switch self {
        case .decodingError: return "Decoding error"
        case .invalidURL: return "Invalid URL"
        case .invalidStatusCode: return "Invalid status code"
        }
    }
}
