//
//  User.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 17.05.2024.
//

import FirebaseFirestoreSwift
import FirebaseFirestore

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let email: String
    let username: String
    let fullName: String
    let profileImageUrl: String
}

