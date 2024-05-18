//
//  SideMenuView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 14.05.2024.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullName)
                            .font(.headline)
                        
                        Text("@\(user.username)")
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
                            ProfileView(user: user)
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
}

/*
#Preview {
    SideMenuView()
}*/
