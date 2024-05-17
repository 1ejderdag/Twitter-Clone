//
//  UserService.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 17.05.2024.
//

import Firebase

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                completion(user)
                //print("DEBUG: Username is \(user.username)")
                //print("DEBUG: Email is \(user.email)")
                
            }
    }
}
