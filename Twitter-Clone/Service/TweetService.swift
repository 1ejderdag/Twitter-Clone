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
                    print("DEBUG: Failed uploding tweet. Error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
                print("DEBUG: Did upload tweet")
            }
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
            completion(tweets)
        }
        
    }
    
    func fetchTweets(forUid uid: String, completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
            completion(tweets.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
        }
    }
}
