//
//  UserService.swift
//  CombineExample
//
//  Created by Nitin Bhatt on 15/01/25.
//

import Foundation
import Combine

class UserService {
    @Published var users: [User] = []
    
    var cancellable: AnyCancellable?
    
    init() {
        getUsers()
    }
    
    func getUsers() {
        guard let url = URL(string: APIPath().users) else { return }

        cancellable = HTTPRequestHelper.request(url: url)
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: HTTPRequestHelper.handleCompletion, receiveValue: { [weak self] (users) in
                self?.users = users
                self?.cancellable?.cancel()
            })
    }
}
