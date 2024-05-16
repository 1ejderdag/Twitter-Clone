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
