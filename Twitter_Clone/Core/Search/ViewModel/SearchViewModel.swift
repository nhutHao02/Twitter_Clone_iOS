//
//  SearchViewModel.swift
//  Twitter_Clone
//
//  Created by TranHao on 21/02/2024.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users:[User] = []
    @Published var searchText = ""
    
    var searchedUser: [User] {
        if self.searchText.isEmpty {
            return users
        } else {
            let lowerCaseQuery = searchText.lowercased()
            return users.filter({
                $0.userName.lowercased().contains(lowerCaseQuery) ||
                $0.fullName.lowercased().contains(lowerCaseQuery)
            })
        }
    }
    let service = UserService()
    
    init() {
        self.fetchUsers()
    }
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
