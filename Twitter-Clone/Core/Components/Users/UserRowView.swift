//
//  UserRowView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 14.05.2024.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack {
            
            Circle()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color(.black))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("ejderdag")
                    .font(.subheadline).bold()
                    //.foregroundStyle(Color(.black))
                
                Text("Ejder Dag")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    UserRowView()
}
