//
//  SpellTableViewController.swift
//  DND_Project
//
//  Created by Hayden Hoki on 3/1/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation
import UIKit

class SpellTableViewController: UITableViewController {
    
    @IBOutlet weak var cancelButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    var spellArray: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelButtonOutlet.isEnabled = false
        SpellReferencePath.spellPath.createSpellLibrary { (spellIndex) in
            
            self.spellArray = spellIndex
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let spellCell = tableView.dequeueReusableCell(withIdentifier: "SpellCell") as? SpellTableViewCell
        let spell = spellArray[indexPath.row]
        spellCell?.spellNameLabel.text = spell["name"] as? String
        
        guard let cell = spellCell else { return UITableViewCell() }
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spellArray.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = tableView.indexPathForSelectedRow,
            let destinationVC = segue.destination as? DetailSpellViewController else { return }
        
        let spell = spellArray[indexPath.row]
        destinationVC.selectedSpell = spell
    }
}
