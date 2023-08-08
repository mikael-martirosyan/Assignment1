//
//  Response.Result + Equatable.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 07.08.2023.
//

extension Response.Result: Equatable {
    static func == (lhs: Response.Result, rhs: Response.Result) -> Bool {
        lhs.id == rhs.id
    }
}
