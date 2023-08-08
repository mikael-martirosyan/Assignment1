//
//  UserListViewModel.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 07.08.2023.
//

import Foundation

class UserListViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published private(set) var users: [User] = []
    private let usersPerPage: Int = 20
    private var isLoading: Bool = false
    private var page: Int = 1
    
    // MARK: - Functions
    func fetchData() async throws {
        guard !isLoading else { return }
        
        isLoading = true
        
        do {
            let users: [User] = try await NetworkService.shared.fetchData(page: page, usersLimit: usersPerPage)
            
            DispatchQueue.main.async {
                self.users.append(contentsOf: users)
                self.isLoading = false
            }
            
            page += 1
        } catch {
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
            throw error
        }
    }
    
    /// User check for infinite scroll
    func checkUser(by name: String) -> Bool {
        let redPointUserIndex = users.count - 6
        let redPointUser = users[redPointUserIndex]
        
        return name == redPointUser.fullName
    }
}



