//
//  UserViewModel.swift
//  CombineExample
//
//  Created by Nitin Bhatt on 15/01/25.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    private let userService = UserService()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchUsers() {
//      Update users data
        userService.$users
            .sink { [weak self] (users) in
                self?.users = users
            }
            .store(in: &cancellables) // Store the cancellable to manage the subscription lifecycle
    }
}
