//
//  DetailMonsterViewController.swift
//  DND_Project
//
//  Created by Hayden Hoki on 3/17/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import UIKit

class DetailMonsterViewController: UIViewController {

    // MARK: - Variable Declaration
    var monsterStatArray: [String] = []
    var notAvailable: String = "N/A"
    var monName: String = ""
    var monSize: String = ""
    var monType: String = ""
    var monAlignment: String = ""
    var monAC: Int = 0
    var monHealth: Int = 0
    var monHitDice: String = ""
    var monSpeed: String = ""
    var monStrength: Int = 0
    var monConstitution: Int = 0
    var monDexterity: Int = 0
    var monIntelligence: Int = 0
    var monWisdom: Int = 0
    var monCharisma: Int = 0
    var monSTRsave: Int? = nil
    var monCONsave: Int? = nil
    var monDEXsave: Int? = nil
    var monINTsave: Int? = nil
    var monWISsave: Int? = nil
    var monCHAsave: Int? = nil
    
    // Monster Skills
    var monVulnerabilities: String = ""
    var monResistances: String = ""
    var monImmunities: String = ""
    var monConditionImmunities: String = ""
    var monLanguages: String = ""
    var monSenses: String = ""
    var monCR: Any = 0
    var monSpecialAbilities: [Dictionary<String, Any>]? = nil
    var monActions: [Dictionary<String, Any>]? = nil
    
    @IBOutlet weak var monsterNameLabel: UILabel!
    @IBOutlet weak var monsterTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monsterStatArray = [monName, monSize, monType, monAlignment, monVulnerabilities, monImmunities, monConditionImmunities, monResistances, monSenses, monLanguages]
        updateMonster()
    }
    
    var selectedMonster: [String: Any]?
    
    func updateMonster() {
        MonsterReferencePath.monsterPath.createMonsterLibrary { (monsterIndex) in
            guard let selectedMonster = self.selectedMonster else { return }

            self.monName = selectedMonster["name"] as! String
            self.monSize = selectedMonster["size"] as! String
            self.monType = selectedMonster["type"] as! String
            self.monAlignment = selectedMonster["alignment"] as! String
            self.monAC = selectedMonster["armor_class"] as! Int
            self.monHealth = selectedMonster["hit_points"] as! Int
            self.monHitDice = selectedMonster["hit_dice"] as! String
            self.monSpeed = selectedMonster["speed"] as! String
            self.monStrength = selectedMonster["strength"] as! Int
            self.monDexterity = selectedMonster["dexterity"] as! Int
            self.monConstitution = selectedMonster["constitution"] as! Int
            self.monIntelligence = selectedMonster["intelligence"] as! Int
            self.monWisdom = selectedMonster["wisdom"] as! Int
            self.monCharisma = selectedMonster["charisma"] as! Int
            self.monSTRsave = selectedMonster["strength_save"] as? Int ?? self.monStrength
            self.monDEXsave = selectedMonster["dexterity_save"] as? Int ?? self.monDexterity
            self.monCONsave = selectedMonster["constitution_save"] as? Int ?? self.monConstitution
            self.monINTsave = selectedMonster["intelligence_save"] as? Int ?? self.monIntelligence
            self.monWISsave = selectedMonster["wisdom_save"] as? Int ?? self.monWisdom
            self.monCHAsave = selectedMonster["charisma_save"] as? Int ?? self.monCharisma
            self.monVulnerabilities = selectedMonster["damage_vulnerabilities"] as! String
            self.monResistances = selectedMonster["damage_resistances"] as! String
            self.monImmunities = selectedMonster["damage_immunities"] as! String
            self.monConditionImmunities = selectedMonster["condition_immunities"] as! String
            self.monSenses = selectedMonster["senses"] as! String
            self.monLanguages = selectedMonster["languages"] as! String
            if let cr = (selectedMonster["challenge_rating"] as? Int) {
                self.monCR = cr
            } else {
                self.monCR = "None"
            }
            self.monSpecialAbilities = selectedMonster["special_abilities"] as? [Dictionary<String, Any>]
            self.monActions = selectedMonster["actions"] as? [Dictionary<String, Any>]
            
            if self.monVulnerabilities == "" {
                self.monVulnerabilities = "None"
            }
            if self.monResistances == "" {
                self.monResistances = "None"
            }
            if self.monLanguages == "" {
                self.monLanguages = "None"
            }
            if self.monImmunities == "" {
                self.monImmunities = "None"
            }
            if self.monConditionImmunities == "" {
                self.monConditionImmunities = "None"
            }
            
            DispatchQueue.main.async {
                self.monsterNameLabel.text = self.monName
                self.monsterTextView.text = """
Size:    \(self.monSize)
Type:    \(self.monType)
Alignment:    \(self.monAlignment)
Armor Class:    \(self.monAC)
Health:   \(self.monHealth)
Hit Dice:    \(self.monHitDice)
Speed:     \(self.monSpeed)
                
STR: \(self.monStrength)     WIS: \(self.monWisdom)
DEX: \(self.monDexterity)     INT: \(self.monIntelligence)
CON: \(self.monConstitution)     CHA: \(self.monCharisma)

Vulnerabilities:    \(self.monVulnerabilities)
Resistances:    \(self.monResistances)
Immunities:    \(self.monImmunities)
Condition Immunities:    \(self.monConditionImmunities)
Senses:    \(self.monSenses)
Languages:    \(self.monLanguages)
Challenge Rating:    \(self.monCR)
"""
            }
        }
        
        func monsterAbilitiesFunc() {
            
        }
    }
}

