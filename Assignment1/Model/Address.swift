//
//  Address.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 11.08.2023.
//

struct Address {
    var streetNumber: Int
    var streetName: String
    var city: String
    var state: String
    var country: String
    
    // For displaying in ProfileView.
    var fullAddress: String {
        "\(streetNumber) \(streetName), \(city), \(state), \(country)"
    }
    
    // Used to get coordinates at an address using geocoding.
    // Property doesn't contain other location items,
    // because the address of user from https://randomuser.me is not exist.
    // The search is carried out by city.
    var shortAddress: String {
        "\(city), \(state), \(country)"
    }
}
