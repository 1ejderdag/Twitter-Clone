//
//  LoginView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 15.05.2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        // parent container
        
        VStack {
            
            AuthHeaderView(row1: "Hello.", row2: "Welcome Back")
            
            VStack(spacing: 30) {
                
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(imageName: "lock", placeholderText: "Password", text: $password)
                
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("clicked forgot password")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 5)
                }
            }
                
            Button {
                //Sign In Button clicked
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .frame(width: 350, height: 60)
                    .foregroundStyle(Color(.white))
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10)
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .toolbar(.hidden)
            } label: {
                
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 30)
            .foregroundStyle(Color(.systemBlue))

        }
        .ignoresSafeArea()
        .toolbar(.hidden) // navigationBarHidden(true)
    }
}

#Preview {
    LoginView()
}

/*
VStack {
    ZStack {
        RoundedRectangle(cornerRadius: 80)
            .frame(width: 500, height: 250)
            .foregroundStyle(Color(.systemBlue))
        Text("Hello. \nWelcome Back")
            .font(.title).bold()
            .foregroundStyle(Color(.white))
    }
    .ignoresSafeArea()
    .offset(x:-50, y: -80)
    
    Spacer()
    
    VStack {
        
    }
}*/
