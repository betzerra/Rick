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
        HStack (spacing: 12) {
            AsyncImage(url: character.image) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50, alignment: .center)
            .clipShape(Circle())
            Text(character.name)
        }
        .padding(4)
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        let mock = Character(
            id: 1,
            name: "Rick Sanchez",
            image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!)
        CharacterRow(character: mock)
    }
}
