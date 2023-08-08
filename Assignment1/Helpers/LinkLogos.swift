//
//  LinkLogos.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 03.08.2023.
//

enum LinkLogos: CaseIterable, Identifiable {
    case twitter
    case linkedIn
    case github
    case standartLink

    var id: Self { self }
    
    var description: String {
        switch self {
        case .twitter: return "twitter_logo"
        case .linkedIn: return "linkedin_logo"
        case .github: return "github_logo"
        case .standartLink: return "standartLink_logo"
        }
    }
}
