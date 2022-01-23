//
//  Character.swift
//  Rick
//
//  Created by Ezequiel Becerra on 23/01/2022.
//

import Foundation
import SwiftUI

/// Rick & Morty character
/// https://rickandmortyapi.com/documentation/#character-schema
///
class Character: Codable, Identifiable {

    enum Status: String, Codable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown

        var color: Color {
            switch self {
            case .alive:
                return .green
            case .dead:
                return .red
            case .unknown:
                return .gray
            }
        }

        var text: String {
            switch self {
            case .alive:
                return "Alive"
            case .dead:
                return "Dead"
            case .unknown:
                return "N/A"
            }
        }
    }

    /// The id of the character.
    let id: Int

    /// The name of the character.
    let name: String

    /// The status of the character ('Alive', 'Dead' or 'unknown').
    let status: Status

    /// The species of the character.
    let species: String

    /// The type or subspecies of the character.
    var type: String?

    /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
    /// #TODO: Change this into an enum
    var gender: String?

    /// Name and link to the character's origin location.
    /// #TODO: Implement
    /// let origin: Origin

    /// Name and link to the character's last known location endpoint.
    /// #TODO: Implement
    /// let location: Location

    /// Link to the character's image.
    /// - Note: All images are 300x300px and most are medium shots or portraits
    /// since they are intended to be used as avatars.
    let image: URL

    /// List of episodes in which this character appeared.
    /// #TODO: Implement
    /// let episodes: [Episode]

    /// Link to the character's own URL endpoint.
    var url: URL?

    /// Time at which the character was created in the database.
    var created: Date?

    init(id: Int, name: String, image: URL, species: String, status: Status) {
        self.id = id
        self.name = name
        self.image = image
        self.species = species
        self.status = status
    }

    static func mock() -> Character {
        Character(
            id: 1,
            name: "Rick Sanchez",
            image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
            species: "Human",
            status: .alive
        )
    }
}
