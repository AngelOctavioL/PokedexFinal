//
//  DataLoader.swift
//  PokedexTablesTabBar
//
//  Created by Angel Octavio Lopez Cruz on 01/06/24.
//

import UIKit

class DataLoader {
    static func loadPokemonData() -> [Pokemon] {
        guard let url = Bundle.main.url(forResource: "pokemon", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return []
        }
        
        let decoder = JSONDecoder()
        return (try? decoder.decode([Pokemon].self, from: data)) ?? []
    }
    
    static func loadTypesData() -> [PokemonType] {
        guard let url = Bundle.main.url(forResource: "types", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return []
        }
        
        let decoder = JSONDecoder()
        return (try? decoder.decode([PokemonType].self, from: data)) ?? []
    }
}

