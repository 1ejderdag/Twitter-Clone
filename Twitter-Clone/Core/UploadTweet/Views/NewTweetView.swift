//
//  NewTweetView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 15.05.2024.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    print("clicked Tweet Button")
                } label: {
                    
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundStyle(Color(.white))
                        .clipShape(Capsule())
                    
                }
            }
            .padding() 
            
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("What's happening?", text: $caption)
                    
            }
            .padding()
        }
    }
}

#Preview {
    NewTweetView()
}
