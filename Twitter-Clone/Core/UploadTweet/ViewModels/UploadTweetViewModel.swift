//
//  UploadTweetViewModel.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 19.05.2024.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    
    @Published var didUploadTweet = false
    let tweetService = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        
        tweetService.uploadTweet(caption: caption) { success in
            if success {
                // dismiss screen somehow
                self.didUploadTweet = true
            } else {
                // show error message to user
            }
            
        }
        
    }
}
