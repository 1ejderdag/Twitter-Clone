//
//  ExploreViewModel.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 18.05.2024.
//

import Foundation
class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    let service = UserService()
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowerCasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowerCasedQuery) ||
                $0.fullName.lowercased().contains(lowerCasedQuery)
            })
        }
    }
    
    init() {
        self.fetchUsers()
    }
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            //print("DEBUG: Users ara \(self.users)")
        }
    }
}
