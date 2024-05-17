//
//  ProfilePhotoSelectorView.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 16.05.2024.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack {
            AuthHeaderView(row1: "Setup your account", row2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image("animage")
                        .resizable()
                        .renderingMode(.original)
                        .modifier(ProfileImageModifier())
                        
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            Text("Tap the photo to select an image")
                .foregroundStyle(Color(.gray))
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfilePhoto(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .frame(width: 350, height: 50)
                        .foregroundStyle(Color(.white))
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 140, height: 180)
            .padding(.top, 40)
            .clipShape(Circle())
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
