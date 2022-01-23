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
            Text(character.name)
        }
        .padding(4)
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        let mock = Character(id: 1, name: "Rick Sanchez")
        CharacterRow(character: mock)
    }
}
