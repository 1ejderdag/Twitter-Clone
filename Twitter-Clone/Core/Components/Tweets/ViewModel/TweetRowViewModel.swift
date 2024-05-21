//
//  TweetRowViewModel.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 21.05.2024.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    
    private let service = TweetService()
    @Published var tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet() {
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet() {
        service.checkIfUserLikeTweet(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
    
}


