//
//  FailureView.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 06.08.2023.
//

import SwiftUI

struct FailureView: View {
    let errorMessage: String
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // Background color
            Color(.lightGray)
                .opacity(0.15)
                .ignoresSafeArea()
            
            VStack {
                Image("error_icon")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                Text("Something has gone wrong")
                    .font(.title)
                    .foregroundColor(
                        .gray
                        .opacity(0.7)
                    )
                    .bold()
                
                Text(errorMessage)
                    .font(.title3)
                    .foregroundColor(
                        .gray
                        .opacity(0.7)
                    )
                
                Button {
                    // any action
                } label: {
                    Image("retry_logo")
                }
            }
        }
    }
}

// MARK: - FailureView_Previews
struct FailureView_Previews: PreviewProvider {
    static var previews: some View {
        FailureView(errorMessage: "Server error")
    }
}
