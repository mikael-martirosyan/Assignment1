//
//  Response.Result + Identifiable.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 07.08.2023.
//

import Foundation

extension Response.Result: Identifiable {
    var id: UUID {
        UUID()
    }
}
