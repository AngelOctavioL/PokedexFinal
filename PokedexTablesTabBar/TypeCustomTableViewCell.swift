//
//  TypeCustomTableViewCell.swift
//  PokedexTablesTabBar
//
//  Created by Diplomado on 01/06/24.
//

import UIKit

class TypeCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var cellTypeNameLabel: UILabel!
    @IBOutlet weak var cellTypeImagen: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
