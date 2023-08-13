//
//  UserListView.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 08.08.2023.
//

import Combine
import SwiftUI

struct UserListView: View {
    // MARK: - Properties
    @StateObject var viewModel: UserListViewModel
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users, id: \.id) { user in
                    NavigationLink {
                        ProfileView(user: user)
                    } label: {
                        UserListRow(user: user)
                            .onAppear {
                                Task {
                                    if viewModel.checkUser(by: user.fullName) {
                                        viewModel.fetchData()
                                    }
                                }
                            }
                    }
                }
            }
            .task {
                viewModel.fetchData()
            }
        }
    }
}

// MARK: - NewUserList_Preview
struct NewUserList_Preview: PreviewProvider {
    static var previews: some View {
        UserListView(viewModel: UserListViewModel())
    }
}

