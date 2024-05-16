//
//  Twitter_CloneApp.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 12.05.2024.
//

import SwiftUI
import Firebase


@main
struct Twitter_CloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
