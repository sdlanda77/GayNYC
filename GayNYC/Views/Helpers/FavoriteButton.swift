//
//  FavoriteButton.swift
//  GayNYC
//
//  Created by Sam Landa on 12/28/21.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "checkmark.circle.fill" : "checkmark.circle")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .gray : .white)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
