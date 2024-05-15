//
//  SideMenuOptionRowView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 15.05.2024.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    
    let viewModel: SideMenuViewModel
    
    var body: some View {
        
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundStyle(Color(.gray))
            
            Text(viewModel.title)
                .font(.subheadline)
                .foregroundStyle(Color(.black))
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

#Preview {
    SideMenuOptionRowView(viewModel: .profile)
}
