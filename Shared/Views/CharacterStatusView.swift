//
//  StatusView.swift
//  Rick
//
//  Created by Ezequiel Becerra on 23/01/2022.
//

import Foundation
import SwiftUI

struct CharacterSubtitleView: View {
    let character: Character

    private var subtitleText: String {
        [character.status.text, character.species].joined(separator: " - ")
    }

    var body: some View {
        HStack {
            Circle()
                .fill(character.status.color)
                .frame(width: 10, height: 10)

            Text(subtitleText)
                .foregroundColor(Color.secondary)
        }
    }
}

struct CharacterSubtitleView_Preview: PreviewProvider {
    static var previews: some View {
        CharacterSubtitleView(character: Character.mock())
    }
}
