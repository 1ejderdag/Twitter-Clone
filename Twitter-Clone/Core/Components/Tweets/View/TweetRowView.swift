//
//  TweetRowView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 13.05.2024.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    
    @ObservedObject var viewModel: TweetRowViewModel
    
    init(tweet: Tweet) {
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // profile image + user info + tweet
            if let user = viewModel.tweet.user {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    // user info + tweet caption
                    VStack(alignment: .leading, spacing: 4) {
                        
                        // user info
                        HStack {
                            Text(user.fullName)
                                .font(.subheadline).bold()
                            
                            Text("@\(user.username)")
                                .foregroundStyle(Color(.gray))
                                .font(.caption)
                            
                            Text("3w")
                                .foregroundStyle(Color(.gray))
                                .font(.caption)
                                
                        }
                        // tweet caption
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                    
                }
            }
            
            
            // actions buttons
            HStack() {
                Button {
                    // action goes here...
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action goes here...
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    viewModel.tweet.didLike ?? false ?
                    viewModel.unlikeTweet() :
                    viewModel.likeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundStyle(Color(viewModel.tweet.didLike ?? false ? .red : .gray))
                }
                
                Spacer()
                
                Button {
                    // action goes here...
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }

            }
            .padding()
            .foregroundStyle(Color(.gray))
            
            Divider()
        }
        
    }
}

//#Preview {
//    TweetRowView(caption: "Mock tweet conten")
//}
