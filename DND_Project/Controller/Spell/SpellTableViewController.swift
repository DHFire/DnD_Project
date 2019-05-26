//
//  SpellTableViewController.swift
//  DND_Project
//
//  Created by Hayden Hoki on 3/1/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation
import UIKit

enum FirstLetters: String {
    case a = "A"
    case b = "B"
    case c = "C"
    case d = "D"
    case e = "E"
    case f = "F"
    case g = "G"
    case h = "H"
    case i = "I"
    case j = "J"
    case k = "K"
    case l = "L"
    case m = "M"
    case n = "N"
    case o = "O"
    case p = "P"
    case q = "Q"
    case r = "R"
    case s = "S"
    case t = "T"
    case u = "U"
    case v = "V"
    case w = "W"
    case x = "X"
    case y = "Y"
    case z = "Z"
}

class SpellTableViewController: UITableViewController {
    
    var spellArray: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SpellReferencePath.spellPath.createSpellLibrary { (spellIndex) in
            self.spellArray = spellIndex
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 1:
//            return FirstLetters.a.rawValue
//        case 2:
//            return FirstLetters.b.rawValue
//        case 3:
//            return FirstLetters.c.rawValue
//        case 4:
//            return FirstLetters.d.rawValue
//        case 5:
//            return FirstLetters.e.rawValue
//        case 6:
//            return FirstLetters.f.rawValue
//        case 7:
//            return FirstLetters.g.rawValue
//        case 8:
//            return FirstLetters.h.rawValue
//        case 9:
//            return FirstLetters.i.rawValue
//        case 10:
//            return FirstLetters.j.rawValue
//        case 11:
//            return FirstLetters.k.rawValue
//        case 12:
//            return FirstLetters.l.rawValue
//        case 13:
//            return FirstLetters.m.rawValue
//        case 14:
//            return FirstLetters.n.rawValue
//        case 15:
//            return FirstLetters.o.rawValue
//        case 16:
//            return FirstLetters.p.rawValue
//        case 17:
//            return FirstLetters.q.rawValue
//        case 18:
//            return FirstLetters.r.rawValue
//        case 19:
//            return FirstLetters.s.rawValue
//        case 20:
//            return FirstLetters.t.rawValue
//        case 21:
//            return FirstLetters.u.rawValue
//        case 22:
//            return FirstLetters.v.rawValue
//        case 23:
//            return FirstLetters.w.rawValue
//        case 24:
//            return FirstLetters.x.rawValue
//        case 25:
//            return FirstLetters.y.rawValue
//        case 26:
//            return FirstLetters.z.rawValue
//        default:
//            return FirstLetters.a.rawValue
//        }
//    }
    
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
