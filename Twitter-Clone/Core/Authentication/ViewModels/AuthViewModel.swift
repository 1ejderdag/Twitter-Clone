//
//  AuthViewModel.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 16.05.2024.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    private let userService = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        self.fetchUser()
        
        print("DEBUG: User(id) session is \(String(describing: self.userSession?.uid))")
    }
    
    func login(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login. Error: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: Did log user in")
        }
    }
    
    func register(withEmail email: String, username: String, fullName: String, password: String) {
        //print("DEBUG: Register with email \(email)")
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register. Error: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            //self.userSession = user
            self.tempUserSession = user
            
            print("DEBUG: Registered user successful")
            print("DEBUG: User is \(String(describing: self.userSession))")
            
            let data = ["email": email,
                        "username": username,
                        "fullName": fullName
            ]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { error in
                    if let error = error {
                        print("DEBUG: Error: \(error.localizedDescription)")
                        return
                    }
                    print("DEBUG: User data uploaded")
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut() {
        // set user session to nil so we show login view
        self.userSession = nil
        
        // sign out on server
        try? Auth.auth().signOut()
    }
    
    func uploadProfilePhoto(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                }
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        userService.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
