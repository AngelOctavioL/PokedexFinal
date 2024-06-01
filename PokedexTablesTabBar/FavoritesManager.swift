//
//  FavoritesManager.swift
//  PokedexTablesTabBar
//
//  Created by Diplomado on 01/06/24.
//

import Foundation

class FavoritesManager {
    static let shared = FavoritesManager()
    private init() {}
    
    private var favorites: [Pokemon] = []
    
    func addFavorite(pokemon: Pokemon) {
        if !favorites.contains(where: { $0.pokedexNumber == pokemon.pokedexNumber }) {
            favorites.append(pokemon)
        }
    }
    
    func removeFavorite(pokemon: Pokemon) {
        if let index = favorites.firstIndex(where: { $0.pokedexNumber == pokemon.pokedexNumber }) {
            favorites.remove(at: index)
        }
    }
    
    func getFavorites() -> [Pokemon] {
        return favorites
    }
}

