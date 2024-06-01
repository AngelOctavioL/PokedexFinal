//
//  PokemonCustomTableViewCell.swift
//  PokedexTablesTabBar
//
//  Created by Angel Octavio Lopez Cruz on 01/06/24.
//

import UIKit

class PokemonCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var cellPokemonNumberLabel: UILabel!
    @IBOutlet weak var cellPokemonNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
