//
//  TweetService.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 19.05.2024.
//

import Firebase

struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
                
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String: Any]
        
        Firestore.firestore().collection("tweets").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed uploding tweet")
                    completion(false)
                    return
                }
                completion(true)
                print("DEBUG: Did upload tweet")
            }
    }
}
