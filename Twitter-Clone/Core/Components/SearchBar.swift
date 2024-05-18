//
//  SearchBar.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 18.05.2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding()
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(alignment: .leading) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color(.gray))
                            .frame(minWidth: 8, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                }
        }
        .padding(.horizontal, 4)
    }
}

#Preview {
    SearchBar(text: .constant(""))
        .previewLayout(.sizeThatFits)
}
