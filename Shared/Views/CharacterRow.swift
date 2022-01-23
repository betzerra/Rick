//
//  CharacterRow.swift
//  Rick
//
//  Created by Ezequiel Becerra on 23/01/2022.
//

import Foundation
import SwiftUI

struct CharacterRow: View {
    let character: Character
    var body: some View {
        HStack {
            // Avatar
            AsyncImage(url: character.image) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50, alignment: .center)
            .clipShape(Circle())

            // Information
            VStack (alignment: .leading, spacing: 2) {
                // Character's name
                Text(character.name)
                    .bold()

                // Status + Species subtitle
                CharacterSubtitleView(character: character)
            }
        }
        .padding(4)
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character: Character.mock())
    }
}
