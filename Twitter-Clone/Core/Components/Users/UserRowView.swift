//
//  UserRowView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 14.05.2024.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            
            Circle()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color(.black))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("ejderdag")
                    .font(.subheadline).bold()
                    .foregroundStyle(Color(.black))
                
                Text("Ejder Dag")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

#Preview {
    UserRowView()
}
