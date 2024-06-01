//
//  FavPokeCustomTableViewCell.swift
//  PokedexTablesTabBar
//
//  Created by Diplomado on 01/06/24.
//

import UIKit

class FavPokeCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var favCellPokemonNumberLabel: UILabel!
    @IBOutlet weak var favCellPokemonNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
