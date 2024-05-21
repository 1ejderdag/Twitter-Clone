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
    }
    
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
}


