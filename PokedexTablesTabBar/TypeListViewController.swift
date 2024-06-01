//
//  TypeListViewController.swift
//  PokedexTablesTabBar
//
//  Created by Diplomado on 01/06/24.
//

import UIKit

class TypeListViewController: UIViewController {
    @IBOutlet weak var typeListTableView: UITableView!
    
    var typesList: [PokemonType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeListTableView.dataSource = self
        typeListTableView.delegate = self
        typesList = DataLoader.loadTypesData()
        //print(typesList)
        typeListTableView.register(UINib(nibName: "TypeCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "typeCell")
    }
}

extension TypeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        typesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTypes = typeListTableView.dequeueReusableCell(withIdentifier: "typeCell") as? TypeCustomTableViewCell
        cellTypes?.accessoryType = .disclosureIndicator
        let type = typesList[indexPath.row]
        cellTypes?.cellTypeNameLabel.text = "\(type.type)"
        cellTypes?.cellTypeImagen.image = UIImage(named: "\(type.image)") 

        return cellTypes!
    }
}

extension TypeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedType = typesList[indexPath.row]
        let typeDetailsViewController = TypeDetailsViewController(nibName: "TypeDetailsViewController", bundle: nil)
        typeDetailsViewController.typePokemon = selectedType
        
        navigationController?.pushViewController(typeDetailsViewController, animated: true)
    }
}
