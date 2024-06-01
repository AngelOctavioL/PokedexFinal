//
//  PokemonListViewController.swift
//  PokedexTablesTabBar
//
//  Created by Angel Octavio Lopez Cruz on 01/06/24.
//

import UIKit

class PokemonListViewController: UIViewController {
    @IBOutlet weak var pokemonListTableView: UITableView!
    
    var pokemonList: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonListTableView.dataSource = self
        pokemonListTableView.delegate = self
        pokemonList = DataLoader.loadPokemonData()
        //print(pokemonList)
        pokemonListTableView.register(UINib(nibName: "PokemonCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "pokemonCell")
    }
}

extension PokemonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pokemonListTableView.dequeueReusableCell(withIdentifier: "pokemonCell") as? PokemonCustomTableViewCell
        cell?.accessoryType = .disclosureIndicator
        let pokemon = pokemonList[indexPath.row]
        cell?.cellPokemonNameLabel.text = "\(pokemon.name)"
        cell?.cellPokemonNumberLabel.text = "\(pokemon.pokedexNumber)"

        return cell!
    }
}

extension PokemonListViewController: UITableViewDelegate {
    // Agregando haciendo tapping
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Entro a favoritos")
//        let selectedPokemon = pokemonList[indexPath.row]
//        FavoritesManager.shared.addFavorite(pokemon: selectedPokemon)
//        
//        let alert = UIAlertController(title: "Added to Favorites", message: "\(selectedPokemon.name) has been added to your favorites.", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
//    }
    
    // agregando deslizando
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "Add to Favorites") { (action, view, completionHandler) in
            let selectedPokemon = self.pokemonList[indexPath.row]
            FavoritesManager.shared.addFavorite(pokemon: selectedPokemon)
            
            let alert = UIAlertController(title: "Added to Favorites", message: "\(selectedPokemon.name) has been added to your favorites.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            completionHandler(true)
        }
        addAction.backgroundColor = .systemBlue
        
        let configuration = UISwipeActionsConfiguration(actions: [addAction])
        return configuration
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPokemon = pokemonList[indexPath.row]
        let pokemonDetailsViewController = PokemonDetailsViewController(nibName: "PokemonDetailsViewController", bundle: nil)
        pokemonDetailsViewController.pokemon = selectedPokemon
        
        navigationController?.pushViewController(pokemonDetailsViewController, animated: true)
    }
}
