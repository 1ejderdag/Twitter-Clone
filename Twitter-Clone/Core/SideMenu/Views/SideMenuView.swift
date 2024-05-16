//
//  SideMenuView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 14.05.2024.
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Ejder Dag")
                        .font(.headline)
                    
                    Text("@ejderdag")
                        .font(.caption)
                        .foregroundStyle(Color(.gray))
                }
                
                UserStatsView()
                    .padding(.vertical)
                
                Divider()
            }
            .padding(.leading)
            
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }

                } else if viewModel == .logout {
                    Button {
                        authViewModel.signOut()
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                } else {
                    SideMenuOptionRowView(viewModel: viewModel)
                }

            }
            .padding(.vertical, 4)
            
            Spacer()
        }
    }
}

#Preview {
    SideMenuView()
}
