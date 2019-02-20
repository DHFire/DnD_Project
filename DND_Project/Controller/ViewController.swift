//
//  ViewController.swift
//  DND_Project
//
//  Created by Hayden Hoki on 1/31/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonPress(_ sender: Any) {
        updateView()
    }
    
    func updateView() {
        label1.text = Spell.spellName
        label2.text = Spell.spellDescription
        label3.text = Spell.range
    }
    

}

