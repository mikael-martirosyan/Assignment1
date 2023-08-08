//
//  UserListView.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 08.08.2023.
//

import SwiftUI

struct UserListView: View {
    // MARK: - Properties
    @StateObject var viewModel: UserListViewModel
    @State private var showErrorAlert: Bool = false
    @State private var errorMessage: String = ""
    
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
                                        await fetchData()
                                    }
                                }
                            }
                    }
                }
            }
            .task {
                await fetchData()
            }
            .alert(isPresented: $showErrorAlert) {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    // MARK: - Functions
    /// Proxy function for catching and handling errors
    private func fetchData() async {
        do {
            try await viewModel.fetchData()
        } catch {
            errorMessage = error.localizedDescription
            showErrorAlert = true
        }
    }
}

// MARK: - NewUserList_Preview
struct NewUserList_Preview: PreviewProvider {
    static var previews: some View {
        UserListView(viewModel: UserListViewModel())
    }
}

