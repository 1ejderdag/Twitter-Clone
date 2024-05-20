//
//  Tweet.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 20.05.2024.
//

import Foundation
import FirebaseFirestore

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
}
