//
//  PokemonDetailsViewController.swift
//  PokedexTablesTabBar
//
//  Created by Diplomado on 01/06/24.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    var pokemon: Pokemon?

    @IBOutlet weak var namePokemonLabel: UILabel!
    @IBOutlet weak var typePokemonLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pokemonImagen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pokemon = pokemon {
            namePokemonLabel.text = pokemon.name
            typePokemonLabel.text = "\(pokemon.pokedexNumber)"
            descriptionLabel.text = pokemon.description
            pokemonImagen.image = UIImage(named: "\(pokemon.image)")
        }
    }
}
