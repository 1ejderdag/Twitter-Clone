//
//  UserStatsView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 14.05.2024.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 14) {
            HStack(spacing: 4) {
                Text("123")
                    .font(.subheadline).bold()
                
                Text("Following")
                    .font(.caption)
                    .foregroundStyle(Color(.gray))
            }
            
            HStack(spacing: 4) {
                Text("456")
                    .font(.subheadline).bold()
                
                Text("Followers")
                    .font(.caption)
                    .foregroundStyle(Color(.gray))
            }
        }
    }
}

#Preview {
    UserStatsView()
}
