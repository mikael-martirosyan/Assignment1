//
//  Response.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 04.08.2023.
//

import Foundation

typealias User = Response.Result

struct Response: Decodable {
    var results: [Result]
    
    
    // MARK: - Nested structures
    
    // MARK: Result structure
    struct Result: Decodable {
        
        // MARK: Name strucutre
        private struct Name: Decodable {
            var title: String
            var first: String
            var last: String
        }

        // MARK: Location strucutre
        private struct Location: Decodable {
            struct Street: Decodable {
                var number: Int
                var name: String
            }
            
            var street: Street
            var city: String
            var state: String
            var country: String
        }
        
        // MARK: Picture strucutre
        struct Picture: Decodable {
            var large: String
            var medium: String
            var thumbnail: String
        }
        
        // MARK: - Properties
        private var name: Name
        var fullName: String {
            "\(name.title) \(name.first) \(name.last)"
        }
        
        private var location: Location
        var fullLocation: String {
            "\(location.street.number) \(location.street.name), \(location.city), \(location.state), \(location.country)"
        }
        
        var address: Address {
            Address(streetNumber: location.street.number,
                    streetName: location.street.name,
                    city: location.city,
                    state: location.state,
                    country: location.country)
        }
        
        var picture: Picture
        var email: String
    }
}
