//
//  RollViewController.swift
//  DND_Project
//
//  Created by Hayden Hoki on 3/31/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import UIKit

enum IntResult {
    case array([Int])
    case int(Int)
}
enum Equation: String {
    case plus = "+"
    case minus = "-"
}

class RollViewController: UIViewController {
    
    // MARK: - IBOutlets and Initializers
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!
    
    var equation: String = ""
    var diceSwitch = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        equationLabel.text = equation
        totalValueLabel.text = "0"
    }
    
    
    // MARK: - Number Button Press
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            if equation.last != "d" && equation.last != " " && equation != "" && !(equation.isEmpty) {
                equation.append("\(sender.tag)")
            }
        } else {
            equation.append("\(sender.tag)")
        }
        
        equationLabel.text = equation
    }
    
    // MARK: - Dice Button Pressed
    @IBAction func diceButtonPressed(_ sender: UIButton) {
        if diceSwitch == 0 {
            appendWithOne(sender.tag)
            equationLabel.text = equation
            diceSwitch = 1
        } else {
            equation.append(" + ")
            appendWithOne(sender.tag)
            equationLabel.text = equation
        }
    }
    
    // MARK: - Equation Button Press
    @IBAction func equationButtonPressed(_ sender: UIButton) {
        
        diceSwitch = 0
        if equation.last == " " {
            for _ in 1...3 {
                equation.removeLast()
            }
            switch sender.tag {
            case -1:
                equation.append(" + ")
            case -2:
                equation.append(" - ")
            default:
                break
            }
        } else if equation.last == "d" {
            equation.removeLast()
        } else if equation.isEmpty {
            
        } else {
            
            switch sender.tag {
            case -1:
                equation.append(" + ")
            case -2:
                equation.append(" - ")
            default:
                break
            }
        }
        equationLabel.text = equation
    }
    
    // MARK: - Deleting Buttons
    @IBAction func deleteButtonPressed(_ sender: Any) {
        diceSwitch = 0
        if equation.last == " " {
            for _ in 1...3 {
                equation.removeLast()
            }
        } else if equation.isEmpty {
            
        }else {
            equation.removeLast()
        }
        equationLabel.text = equation
    }
    @IBAction func acButtonPressed(_ sender: Any) {
        equation.removeAll()
        diceSwitch = 0
        equationLabel.text = equation
        totalValueLabel.text = "0"
    }
    
    // MARK: - Roll Button
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        
        var spacelessEquation = equation.split(separator: " ")
        
        if spacelessEquation.last != "" && spacelessEquation.last != " " && spacelessEquation.last != "d" && spacelessEquation.last != "+" && spacelessEquation.last != "-" {
            var valuesArray: [Int] = []
            var equatorCount = 0
            var total = 0
            var counter = 0
            var identifier = 0
            
            func checkForDice(_ object: String.SubSequence) {
                for character in object {
                    if character == "d" {
                        identifier = 1
                    }
                }
            }
            func appendValueArray(_ substringValue: String.SubSequence, equate: Equation) {
                if identifier == 1 {
                    identifier = 0
                    let diceComponentsArray = substringValue.split(separator: "d")
                    let dice = parse(String(diceComponentsArray[0]))
                    if diceComponentsArray.indices.contains(1) {
                        let sides = parse(String(diceComponentsArray[1]))
                        let value = diceRoll(amount: dice, diceSides: sides)
                        if equate == .plus {
                            valuesArray.append(value)
                        } else if equate == .minus {
                            valuesArray.append(-value)
                        }
                    }
                } else {
                    let value = parse(String(substringValue))
                    if equate == .plus {
                        valuesArray.append(value)
                    } else if equate == .minus {
                        valuesArray.append(-value)
                    }
                }
            }
            
            for object in spacelessEquation {
                if object == "+" || object == "-" {
                    equatorCount += 1
                }
            }
            
            if spacelessEquation.count == 1 {
                let substringValue = spacelessEquation[0]
                checkForDice(substringValue)
                appendValueArray(substringValue, equate: .plus)
            } else if spacelessEquation.count > 1 {
                let substringValue = spacelessEquation.removeFirst()
                checkForDice(substringValue)
                appendValueArray(substringValue, equate: .plus)
                for _ in 1...equatorCount {
                    var equator: Equation = .plus
                    let plusOrMinus = spacelessEquation.removeFirst()
                    if plusOrMinus == "+" {
                        equator = .plus
                    } else if plusOrMinus == "-" {
                        equator = .minus
                    }
                    
                    checkForDice(spacelessEquation[0])
                    appendValueArray(spacelessEquation[0], equate: equator)
                    spacelessEquation.removeFirst()
                }
            }
            
            for number in valuesArray {
                total += number
            }
            
            totalValueLabel.text = "\(total)"
        }
    }
    
    // MARK: - Functions
    func appendWithOne(_ diceSides: Int) {
        
        if equation.last == " " || equation.isEmpty || diceSwitch == 1 {
            equation.append("1")
        }
        
        if diceSides == 0 {
            diceSwitch = 0
            equation.append("d")
        } else {
            equation.append("d\(diceSides)")
        }
    }
    func parse(_ s: String?) -> Int {
        guard let s = s,
            let value = Int(s, radix: 10) else { return 0 }
        return value
    }
    func diceRoll(amount numberOfDiceRolled: Int, diceSides: Int) -> Int /* IntResult */ {
        var count = 0
        var total = 0
        var randomNumber: Int = 0
        //        var numArray: [Int] = []
        switch numberOfDiceRolled {
            
        case 1:
            randomNumber = Int.random(in: 1...diceSides)
            return randomNumber
            
        default:
            
            while count < numberOfDiceRolled {
                count += 1
                randomNumber = Int.random(in: 1...diceSides)
                //                numArray.append(randomNumber)
                total += randomNumber
            }
            
            return total
        }
        
    }
}

