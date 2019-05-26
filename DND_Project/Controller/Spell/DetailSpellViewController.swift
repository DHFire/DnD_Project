//
//  DetailSpellViewController.swift
//  DND_Project
//
//  Created by Hayden Hoki on 3/17/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import UIKit

class DetailSpellViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var castingTimeLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var componentsLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var materialsButton: UIButton!
    
    var selectedSpell: [String: Any]?
    var spellName: String = ""
    var spellLevel: Int = 0
    var spellCastingTime: String = ""
    var spellConcentration: String = ""
    var spellRange: String = ""
    var spellComponents: String = ""
    var spellMaterial: String? = nil
    var spellDescription: String = ""
    var spellRitual: String = ""
    var spellDuration: String = ""
    var spellSchool: String = ""
    var spellHigherLevel: String = ""
    var spellClasses: [Dictionary<String, String>] = [Dictionary()]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        materialsButton.isEnabled = false
        materialsButton.isHidden = true
        
        updateIndex()
        self.title = spellName
    }

    @IBAction func materialsButtonPressed(_ sender: Any) {
        materialAlert()
    }
    
    func materialAlert() {
        
        let alert = UIAlertController(title: "Materials", message: "\(spellMaterial ?? "Nothing")", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

    func updateIndex() {
        
        SpellReferencePath.spellPath.createSpellLibrary { (spellIndex) in
           
            guard let selectedSpell = self.selectedSpell else { return }
            
            self.spellName = selectedSpell["name"] as! String
            self.spellLevel = selectedSpell["level"] as! Int
            self.spellCastingTime = selectedSpell["casting_time"] as! String
            self.spellRange = selectedSpell["range"] as! String
            self.spellDuration = selectedSpell["duration"] as! String
            self.spellConcentration = selectedSpell["concentration"] as! String
            self.spellMaterial = selectedSpell["material"] as? String
            
            var componentsArray = selectedSpell["components"] as? [String] ?? []
            for _ in componentsArray {
                self.spellComponents = "\(self.spellComponents) " + componentsArray.removeFirst()
            }
            
            var descriptionArray = selectedSpell["desc"] as? [String] ?? []
            for _ in descriptionArray {
                self.spellDescription = "\(self.spellDescription) " + descriptionArray.removeFirst()
            }
            
            var higherLevelArray = selectedSpell["higher_level"] as? [String] ?? []
            for _ in higherLevelArray {
                self.spellDescription = "\(self.spellDescription) \(higherLevelArray.removeFirst())"
            }
            
            var schoolObject = selectedSpell["school"] as! Dictionary<String, String>
            
            let ritualCast = selectedSpell["ritual"] as? String ?? "no"
            if ritualCast == "yes" {
                self.spellRitual = "(Ritual)"
            }
            
            self.spellSchool = schoolObject["name"] ?? "Fail"
            
            if self.spellMaterial != nil {
                self.materialsButton.isEnabled = true
                self.materialsButton.isHidden = false
            }
            
            if self.spellHigherLevel != "" {
                self.spellDescription = self.spellDescription + "\n" + self.spellHigherLevel
            }
            
            if self.spellConcentration == "yes" {
                self.spellDuration = "\(self.spellDuration) concentration"
            }

            DispatchQueue.main.async {
                self.nameLabel.text = self.spellName
                
                switch self.spellLevel {
                case 0:
                    self.levelLabel.text = "Cantrip"
                case 1:
                    self.levelLabel.text = "\(self.spellLevel)st-Level"
                case 2:
                    self.levelLabel.text = "\(self.spellLevel)nd-Level"
                case 3:
                    self.levelLabel.text = "\(self.spellLevel)rd-Level"
                default:
                    self.levelLabel.text = "\(self.spellLevel)th-Level"
                }
                
                self.levelLabel.text = "\(self.levelLabel.text!) \(self.spellSchool) \(self.spellRitual)"
                
                self.castingTimeLabel.text = "Casting Time: \(self.spellCastingTime)"
            
// self.castingTimeLabel.font = UIFont(name: "HelveticaNeue", size: 19.0)
                
                self.rangeLabel.text = "Range: \(self.spellRange)"
                self.componentsLabel.text = "Components: \(self.spellComponents)"
                self.durationLabel.text = "Duration: \(self.spellDuration)"
                self.descriptionTextView.text = self.spellDescription
            }
        }
    }
    
}
