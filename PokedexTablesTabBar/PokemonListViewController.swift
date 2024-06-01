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
        pokemonList = DataLoader.loadPokemonData()
        print(pokemonList)
        pokemonListTableView.register(UINib(nibName: "PokemonCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "pokemonCell")
    }
}

extension PokemonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pokemonListTableView.dequeueReusableCell(withIdentifier: "pokemonCell") as? PokemonCustomTableViewCell
        let pokemon = pokemonList[indexPath.row]
        cell?.cellPokemonNameLabel.text = "\(pokemon.name)"
        cell?.cellPokemonNumberLabel.text = "\(pokemon.pokedexNumber)"

        return cell!
    }
}
