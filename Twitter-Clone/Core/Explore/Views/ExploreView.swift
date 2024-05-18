//
//  ExploreView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 13.05.2024.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0...25, id: \.self) { _ in
                            NavigationLink {
                                //ProfileView()
                            } label: {
                                UserRowView()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    ExploreView()
}
