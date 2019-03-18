//
//  DetailSpellViewController.swift
//  DND_Project
//
//  Created by Hayden Hoki on 3/17/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import UIKit

class DetailSpellViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    var selectedSpell: [String: Any]?
    
    func updateIndex() {
        SpellReferencePath.spellPath.createSpellLibrary { (spellIndex) in
            DispatchQueue.main.async {
                guard let selectedSpell = self.selectedSpell else { return }
                self.descriptionLabel.text = selectedSpell["desc"] as? String
            }
        }
    }
}
