//
//  User.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 17.05.2024.
//

import FirebaseFirestoreSwift
import FirebaseFirestore
import Firebase

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let email: String
    let username: String
    let fullName: String
    let profileImageUrl: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id}
}

