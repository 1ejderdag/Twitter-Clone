//
//  RegistrationView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 15.05.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullName = ""
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            
        VStack {
            
            AuthHeaderView(row1: "Get started.", row2: "Create your account")
            
            VStack(spacing: 40) {
                
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                CustomInputField(imageName: "person", placeholderText: "Full Name", text: $fullName)
                CustomInputField(imageName: "lock", placeholderText: "Password", text: $password)
            }
            .padding(32)
            
            Button {
                //Sign up Button clicked
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .frame(width: 350, height: 60)
                    .foregroundStyle(Color(.white))
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 30)

        }
        .ignoresSafeArea()
    }
}

#Preview {
    RegistrationView()
}
