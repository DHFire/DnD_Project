//
//  MonsterTableViewController.swift
//  DND_Project
//
//  Created by Hayden Hoki on 3/4/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation
import UIKit

class MonsterTableViewController: UITableViewController {
    
    var monsterArray: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MonsterReferencePath.monsterPath.createMonsterLibrary { (monsterIndex) in
            DispatchQueue.main.async {
                self.monsterArray = monsterIndex
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let monsterCell = tableView.dequeueReusableCell(withIdentifier: "MonsterCell") as? MonsterTableViewCell
        let monster = monsterArray[indexPath.row]
        monsterCell?.monsterNameLabel.text = monster["name"] as? String
        
        guard let cell = monsterCell else { return UITableViewCell() }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monsterArray.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = tableView.indexPathForSelectedRow,
            let destinationVC = segue.destination as? DetailMonsterViewController else { return }
        
        let monster = monsterArray[indexPath.row]
        destinationVC.selectedMonster = monster
    }
}
