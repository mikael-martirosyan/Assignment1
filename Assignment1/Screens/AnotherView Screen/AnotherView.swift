//
//  AnotherView.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 04.08.2023.
//

import SwiftUI

struct AnotherView: View {
    // MARK: - Body
    var body: some View {
        FailureView(errorMessage: "")
    }
}

// MARK: - AnotherView_Previews
struct AnotherView_Previews: PreviewProvider {
    static var previews: some View {
        AnotherView()
    }
}
