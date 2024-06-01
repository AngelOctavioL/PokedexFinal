//
//  DataModel.swift
//  PokedexTablesTabBar
//
//  Created by Angel Octavio Lopez Cruz on 01/06/24.
//

import Foundation

struct Pokemon: Codable {
    let pokedexNumber: Int
    let name: String
    let description: String
    let type: [String]
    let evolutions: [String]
    let image: String
}

struct PokemonType: Codable {
    let type: String
    let image: String
    let doubleDamageDealt: [String]
    let doubleDamageReceived: [String]
    let halfDamageDealt: [String]
    let halfDamageReceived: [String]
    let notAffectedBy: [String]
    let noEffectAgainst: [String]
}


