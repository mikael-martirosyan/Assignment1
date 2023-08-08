//
//  Font + Extension.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 04.08.2023.
//

import SwiftUI

extension Font {
    enum Custom {
        enum Lato: String {
            case regular = "Lato-Regular"
        }
        
        enum RobotoMono: String {
            case bold = "RobotoMono-Bold"
            case regular = "RobotoMono-Regular"
        }
    }
    
    static func latoFont(_ name: Custom.Lato, size: CGFloat) -> Font {
        Font.custom(name.rawValue, size: size)
    }
    
    static func robotoMonoFont(_ name: Custom.RobotoMono, size: CGFloat) -> Font {
        Font.custom(name.rawValue, size: size)
    }
}
