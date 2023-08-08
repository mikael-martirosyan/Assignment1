//
//  UserListRow.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 05.08.2023.
//

import SwiftUI

struct UserListRow: View {
    
    // MARK: - Properties
    var user: Response.Result
    var url: URL? {
        URL(string: user.picture.thumbnail)
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: url)
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)

                Text(user.fullName)
                    .padding(.bottom, 5)
            }
            
            Text(user.fullLocation)
        }
    }
}
