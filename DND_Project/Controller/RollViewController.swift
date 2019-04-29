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
            if (equationLabel.text)?.last != "d" || equation != "" {
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
            
            equationLabel.text = equation
        }
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
        var valuesArray: [Int] = []
        var totalsArray: [Int] = []
        var equatorCount = 0
        var total = 0
        var counter = 0
        
        func appendTotalArray() {
            let substringValue1 = spacelessEquation[0]
            let substringValue2 = spacelessEquation[2]
            var identifier = 0
            
            for _ in 1...3 {
                spacelessEquation.removeFirst()
            }
            
            for character in substringValue1 {
                if character == "d" {
                    identifier = 1
                    break
                }
            }
            
            if identifier == 1 {
                identifier = 0
                let rollValues = substringValue1.split(separator: "d")
                let dice = parse(String(rollValues[0]))
                let isValidIndex = rollValues.indices.contains(1)
                if isValidIndex == true {
                    let sides: Int? = parse(String(rollValues[1]))
                    let value1 = diceRoll(amount: dice, diceSides: sides) ?? 0
                    valuesArray.append(value1)
                }
            } else {
                let value1 = parse(String(substringValue1))
                valuesArray.append(value1)
            }
            
            identifier = 0
            
            for character in substringValue2 {
                if character == "d" {
                    identifier = 1
                    break
                }
            }
            
            if identifier == 1 {
                identifier = 0
                let rollValues = substringValue2.split(separator: "d")
                let dice = parse(String(rollValues[0]))
                let isValidIndex = rollValues.indices.contains(1)
                if isValidIndex == true {
                    let sides: Int? = parse(String(rollValues[1]))
                    let value2 = diceRoll(amount: dice, diceSides: sides) ?? 0
                    valuesArray.append(value2)
                }
            } else {
                let value2 = parse(String(substringValue2))
                valuesArray.append(value2)
            }
        }
        
        if spacelessEquation.count > 1 {
            
            for object in spacelessEquation {
                if object == "+" || object == "-" {
                    equatorCount += 1
                }
            }
            
            for i in 1...equatorCount {
                
                if i == 1 {
                    if spacelessEquation[1] == "+" {
                        appendTotalArray()
                        
                        let addTotal = valuesArray[0] + valuesArray[1]
                        totalsArray.append(addTotal)
                        
                    } else if spacelessEquation[1] == "-" {
                        appendTotalArray()
                        
                        let subtractTotal = valuesArray[0] - valuesArray[1]
                        totalsArray.append(subtractTotal)
                        counter += 1
                    }
                } else {
                    var identifier = 0
                    let equator = spacelessEquation[0]
                    let subValue = spacelessEquation[1]
                    spacelessEquation.removeFirst() ; spacelessEquation.removeFirst()
                    
                    if equator == "+" {
                        for character in subValue {
                            if character == "d" {
                                identifier = 1
                                break
                            }
                        }
                        
                        if identifier == 1 {
                            identifier = 0
                            let rollValue = subValue.split(separator: "d")
                            let dice = parse(String(rollValue[0]))
                            let isValidIndex = rollValue.indices.contains(1)
                            if isValidIndex == true {
                                let sides: Int? = parse(String(rollValue[1]))
                                let value = diceRoll(amount: dice, diceSides: sides) ?? 0
                                valuesArray.append(value)
                            }
                        } else {
                            let value = parse(String(subValue))
                            valuesArray.append(value)
                        }
                        
                        let addTotal = valuesArray[0] + valuesArray[1]
                        totalsArray.append(addTotal)
                    } else if equator == "-" {
                        for character in subValue {
                            if character == "d" {
                                identifier = 1
                                break
                            }
                        }
                        
                        if identifier == 1 {
                            identifier = 0
                            let rollValue = subValue.split(separator: "d")
                            let dice = parse(String(rollValue[0]))
                            let isValidIndex = rollValue.indices.contains(1)
                            if isValidIndex == true {
                                let sides: Int? = parse(String(rollValue[1]))
                                let value = diceRoll(amount: dice, diceSides: sides) ?? 0
                                valuesArray.append(value)
                            }
                        } else {
                            let value = parse(String(subValue))
                            valuesArray.append(value)
                        }
                        
                        let subtractTotal = (-valuesArray[0]) + (-valuesArray[1])
                        totalsArray.append(subtractTotal)
                    }
                }
            }
            
        } else if spacelessEquation.count == 1 {
            let substringValue = spacelessEquation[0]
            var identifier = 0
            for character in substringValue {
                if character == "d" {
                    identifier = 1
                    break
                }
            }
            
            if identifier == 1 {
                identifier = 0
                let rollValues = substringValue.split(separator: "d")
                let dice = parse(String(rollValues[0]))
                let isValidIndex = rollValues.indices.contains(1)
                if isValidIndex == true {
                    let sides: Int? = parse(String(rollValues[1]))
                    let value = diceRoll(amount: dice, diceSides: sides) ?? 0
                    totalsArray.append(value)
                }
            } else {
                let value = parse(String(substringValue))
                totalsArray.append(value)
            }
        } else {
            print("This is the thing saying the roll function sucks.")
        }
        
        for number in totalsArray {
            total += number
        }
        
        totalValueLabel.text = "\(total)"
    } // Ending roll button pressed action.
    
    
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
    func diceRoll(amount numberOfDiceRolled: Int, diceSides: Int?) -> Int? /* IntResult */ {
        var count = 0
        var total = 0
        var randomNumber: Int = 0
        //        var numArray: [Int] = []
        if let sides = diceSides {
            
            switch numberOfDiceRolled {
                
            case 1:
                randomNumber = Int.random(in: 1...sides)
                return randomNumber
                
            default:
                
                while count < numberOfDiceRolled {
                    count += 1
                    randomNumber = Int.random(in: 1...sides)
                    //                numArray.append(randomNumber)
                    total += randomNumber
                }
                
                return total
            }
        } else {
            return nil
        }
    }
}

