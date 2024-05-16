//
//  ContentView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 12.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        Group {
            
            if viewModel.userSession == nil {
                // no user logged in
                LoginView()
            } else {
                // have a logged in user
                mainInterfaceView
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}

extension ContentView {
    
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .toolbar(showMenu ? .hidden : .visible) // .navigationBarHidden(showMenu) is depreceted.
            
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(showMenu ? 0.3 : 0.0)
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 32, height: 32)
                        
                }

            }
        }
        .onAppear {
            showMenu = false // toolbar tekrar açıldığında side menu kapalı olacak.
        }
    }
}
