//
//  UserListViewModel.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 11.08.2023.
//

import Combine
import Foundation

final class UserListViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published private(set) var users: [User] = []
    private let usersPerPage: Int = 20
    private var isLoading: Bool = false
    private var page: Int = 1
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Functions
    func fetchData() {
        guard !isLoading else { return }
        
        isLoading = true
        
        NetworkService.shared.fetchData(page: page, usersLimit: usersPerPage)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                
                switch completion {
                case .finished:
                    self.page += 1
                    self.isLoading = false
                case .failure(_):
                    self.isLoading = false
                }
            } receiveValue: { [weak self] users in
                guard let self = self else { return }
                
                self.users.append(contentsOf: users)
            }
            .store(in: &cancellables)
    }
    
    /// User check for infinite scroll
    func checkUser(by name: String) -> Bool {
        let redPointUserIndex = users.count - 6
        
        guard redPointUserIndex >= 0,
              redPointUserIndex < users.count
        else {
            return false
        }
        
        let redPointUser = users[redPointUserIndex]
        
        return name == redPointUser.fullName
    }
}
