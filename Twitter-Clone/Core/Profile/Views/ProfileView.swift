//
//  ProfileView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 13.05.2024.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.dismiss) private var dismiss
    @Namespace var animation
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
            userInfoDetails
            
            tweetFilterBar
            
            tweetsView
            
            Spacer()
        }
        .toolbar(.hidden)
    }
}

#Preview {
    ProfileView(user: User(id: NSUUID().uuidString,
                           email: "deneme@gmail.com", 
                           username: "deneme",
                           fullName: "Deneme deneme",
                           profileImageUrl: ""))
}

extension ProfileView {
    
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundStyle(Color(.white))
                        .offset(x: 16, y: -4)
                }

                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            
            Button {
                
            } label: {
                Text("Edit profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundStyle(Color(.black))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing, 10)
    }
    
    var userInfoDetails: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(viewModel.user.fullName)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundStyle(Color(.gray))
            
            Text("This is a biography")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Amsterdam, NL")
                }
                
                HStack {
                    Image(systemName: "link")
                    
                    Text("twitter.com")
                }
            }
            .font(.caption)
            .foregroundStyle(Color(.gray))
            
            UserStatsView()
                .padding(.vertical)
            
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundStyle(Color(selectedFilter == item ? .black : .gray))
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundStyle(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundStyle(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0,y: 15))
    }
    
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.tweets) { tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
                
            }
        }

    }
}
