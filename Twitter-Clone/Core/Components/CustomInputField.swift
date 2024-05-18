//
//  CustomInputField.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 15.05.2024.
//

import SwiftUI

struct CustomInputField: View {
    
    let imageName: String
    let placeholderText: String
    var isSecured: Bool? = false
    @Binding var text: String
    
    var body: some View {

        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color(.darkGray))
                
                if isSecured ?? false {
                    SecureField(placeholderText, text: $text)
                } else {
                    TextField(placeholderText, text: $text)
                }
                
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}

#Preview {
    CustomInputField(imageName: "envelope", placeholderText: "Email", text: .constant(""))
}
