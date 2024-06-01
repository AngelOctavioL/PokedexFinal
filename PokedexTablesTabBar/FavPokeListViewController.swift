//
//  FavPokeListViewController.swift
//  PokedexTablesTabBar
//
//  Created by Diplomado on 01/06/24.
//

import UIKit

class FavPokeListViewController: UIViewController {
    @IBOutlet weak var favPokemonListTableView: UITableView!
    
    var favorites: [Pokemon] {
        return FavoritesManager.shared.getFavorites()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favPokemonListTableView.dataSource = self
        favPokemonListTableView.delegate = self
        favPokemonListTableView.register(UINib(nibName: "FavPokeCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "favPokemonCell")
        print(favorites)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favPokemonListTableView.reloadData()
    }
}

extension FavPokeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellFav = favPokemonListTableView.dequeueReusableCell(withIdentifier: "favPokemonCell") as? FavPokeCustomTableViewCell
        cellFav?.accessoryType = .disclosureIndicator
        let pokemon = favorites[indexPath.row]
        cellFav?.favCellPokemonNameLabel.text = "\(pokemon.name)"
        cellFav?.favCellPokemonNumberLabel.text = "\(pokemon.pokedexNumber)"
        
        return cellFav!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let pokemonToRemove = favorites[indexPath.row]
            FavoritesManager.shared.removeFavorite(pokemon: pokemonToRemove)
            
            // Recarga la tabla para reflejar los cambios
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension FavPokeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPokemon = favorites[indexPath.row]
        let pokemonDetailsViewController = PokemonDetailsViewController(nibName: "PokemonDetailsViewController", bundle: nil)
        pokemonDetailsViewController.pokemon = selectedPokemon
        
        navigationController?.pushViewController(pokemonDetailsViewController, animated: true)
    }
}
