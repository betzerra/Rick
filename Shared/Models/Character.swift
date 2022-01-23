//
//  Character.swift
//  Rick
//
//  Created by Ezequiel Becerra on 23/01/2022.
//

import Foundation

/// Rick & Morty character
/// https://rickandmortyapi.com/documentation/#character-schema
///
class Character: Codable, Identifiable {
    /// The id of the character.
    let id: Int

    /// The name of the character.
    let name: String

    /// The status of the character ('Alive', 'Dead' or 'unknown').
    /// #TODO: Change this into an enum
    var status: String?

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
    /// - Note: All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
    let image: URL

    /// List of episodes in which this character appeared.
    /// #TODO: Implement
    /// let episodes: [Episode]

    /// Link to the character's own URL endpoint.
    var url: URL?

    /// Time at which the character was created in the database.
    var created: Date?

    init(id: Int, name: String, image: URL, species: String) {
        self.id = id
        self.name = name
        self.image = image
        self.species = species
    }
}
