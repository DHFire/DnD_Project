//
//  ViewController.swift
//  DND_Project
//
//  Created by Hayden Hoki on 1/31/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    
    var selectedSpell: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //numberTextField.keyboardType = UIKeyboardType.numberPad
        
        
    }
    
    @IBAction func GetSpell(_ sender: Any) {
        getSpellFromIndex()
    }
    
    func updateView() {
        
    }
    
    func getSpellFromIndex() {
        SpellReferencePath.spellPath.createSpellLibrary { (spellIndex) in
            DispatchQueue.main.async {
                guard let selectedSpell = self.selectedSpell else { return }
                self.descriptionLabel.text = selectedSpell["desc"] as? String
             //   guard let description = spellIndex["desc"] as? [String: Any], let firstDescription = description.first else { return }
             //   self.descriptionLabel.text = firstDescription
            }
        }
    }
}

