//
//  FeedView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 13.05.2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach(0...20, id: \.self) { _ in
                    Text("Tweet Row View")
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
