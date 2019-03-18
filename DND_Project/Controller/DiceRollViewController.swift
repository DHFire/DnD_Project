//
//  DiceRollViewController.swift
//  DND_Project
//
//  Created by Hayden Hoki on 2/8/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import UIKit

class DiceRollViewController: UIViewController {

    @IBOutlet weak var rolledNumberLabel: UILabel!
    @IBOutlet weak var naturalRollLabel: UILabel!
    @IBOutlet weak var modifierButtonText: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    
    var stepperHiddenValue = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.autorepeat = true
        stepper.wraps = false
        stepper.minimumValue = -50
        stepper.maximumValue = 50
        stepper.isHidden = stepperHiddenValue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        modifierButtonText.setTitle("0", for: .normal)
        naturalRollLabel.text = "-"
        rolledNumberLabel.text = "-"
    }
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        let randomNumber = Int.random(in: 1...20)
        let stepperNumber = Int(stepper.value)
        
        if randomNumber == 20 {
            rolledNumberLabel.textColor = #colorLiteral(red: 0.2191921314, green: 0.771514118, blue: 0.04486300916, alpha: 1)
        } else if randomNumber == 1 {
            rolledNumberLabel.textColor = #colorLiteral(red: 0.7620790566, green: 0.1446520376, blue: 0.08973766644, alpha: 1)
        } else {
            rolledNumberLabel.textColor = #colorLiteral(red: 0.8585654145, green: 0.8585654145, blue: 0.8585654145, alpha: 1)
        }
        
        naturalRollLabel.text = "\(randomNumber)"
        rolledNumberLabel.text = "\(randomNumber + stepperNumber)"
    }
    
    @IBAction func modifierButtonPressed(_ sender: Any) {
        stepperHiddenValue = !stepperHiddenValue
        stepper.isHidden = stepperHiddenValue
    }
    
    @IBAction func stepperPressed(_ sender: Any) {
        let stepperNumber = Int(stepper.value)

        if stepperNumber > 0 {
            modifierButtonText.setTitle("+\(stepperNumber)", for: .normal)
        } else {
            modifierButtonText.setTitle("\(stepperNumber)", for: .normal)
        }
    }
}
