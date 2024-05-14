//
//  TweetRowView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 13.05.2024.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            // profile image + user info + tweet
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundStyle(Color(.systemBlue))
                
                // user info + tweet caption
                VStack(alignment: .leading, spacing: 4) {
                    
                    // user info
                    HStack {
                        Text("Ejder Dag")
                            .font(.subheadline).bold()
                        
                        Text("ejderdag")
                            .foregroundStyle(Color(.gray))
                            .font(.caption)
                        
                        Text("3w")
                            .foregroundStyle(Color(.gray))
                            .font(.caption)
                            
                    }
                    
                    // tweet caption
                    Text("This is my first tweet")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
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
                    // action goes here...
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
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

#Preview {
    TweetRowView()
}
