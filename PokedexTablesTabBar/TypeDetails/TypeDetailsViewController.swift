//
//  TypeDetailsViewController.swift
//  PokedexTablesTabBar
//
//  Created by Diplomado on 01/06/24.
//

import UIKit

class TypeDetailsViewController: UIViewController {
    var typePokemon: PokemonType?
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var damageLabel: UILabel!
    @IBOutlet weak var typeImagen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if typePokemon != nil {
            typeLabel.text = typePokemon?.type
            damageLabel.text = typePokemon?.doubleDamageDealt.joined(separator:" ") ?? ""
            typeImagen.image = UIImage(named: "\(typePokemon?.image ?? "")")
        }
    }
}
