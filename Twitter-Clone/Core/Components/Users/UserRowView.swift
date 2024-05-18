//
//  UserRowView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 14.05.2024.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.subheadline).bold()
                    .foregroundStyle(Color(.black))
                
                Text(user.fullName)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}
/*
#Preview {
    UserRowView()
}*/
