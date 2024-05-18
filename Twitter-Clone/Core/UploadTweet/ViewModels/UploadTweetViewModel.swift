//
//  UploadTweetViewModel.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 19.05.2024.
//

import Foundation

class UploadTweetViewModel: ObservableObject {

    let tweetService = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        
        tweetService.uploadTweet(caption: caption) { success in
            if success {
                // dismiss screen somehow
            } else {
                // show error message to user
            }
            
        }
        
    }
}
