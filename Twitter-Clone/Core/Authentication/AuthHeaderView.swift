//
//  AuthHeaderView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 16.05.2024.
//

import SwiftUI

struct AuthHeaderView: View {
    let row1: String
    let row2: String
    var body: some View {
        // header view
        VStack(alignment: .leading) {
            HStack { Spacer() }
            Text("\(row1)\n\(row2)")
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundStyle(Color(.white))
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

#Preview {
    AuthHeaderView(row1: "Hello", row2: "Welcome Back")
}
