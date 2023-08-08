//
//  ProfileView.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 04.08.2023.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Properties
    let user: User
    
    private var url: URL? {
        URL(string: user.picture.large)
    }

    // MARK: - Body
    var body: some View {
            VStack {
                
                // MARK: Avatar image
                AsyncImage(url: url)
//                { image in
//                    image
//                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 175.0, height: 175.0)
//                } placeholder: {
//                    Circle()
//                        .fill(Color.gray)
//                        .opacity(0.8)
//                        .frame(width: 175.0, height: 175.0)
//                }

                // MARK: Information
                Text(user.fullName)
                    .foregroundColor(Color.black)
                    .font(Font.robotoMonoFont(.bold, size: 29.0))
                    .multilineTextAlignment(.center)

                Text(user.email)
                    .foregroundColor(Color.black)
                    .font(Font.robotoMonoFont(.regular, size: 18.0))
                    .padding()
                
                Text(user.fullLocation)
                    .foregroundColor(Color.black)
                    .font(Font.latoFont(.regular, size: 18.0))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)

                // MARK: Links
                HStack {
                    ForEach(LinkLogos.allCases) { Image($0.description) }
                }
                .padding()
            }
            .padding()
            .task {
            }
    }
}
