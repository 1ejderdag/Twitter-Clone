//
//  delLater.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 16.05.2024.
//

import SwiftUI

struct delLater: View {
    @State private var showModal = false

    var body: some View {
        VStack {
            Button("Show Modal") {
                showModal = true
            }
            .sheet(isPresented: $showModal) {
                ModalView()
            }
        }
    }
}

struct ModalView: View {
    var body: some View {
        Text("Another content")
    }
    
    var head: some View {
        Text("This is a modal view")
            .font(.largeTitle)
            .padding()
    }
    
    
}

#Preview {
    delLater()
}
