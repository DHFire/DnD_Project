//
//  DetailSpellViewController.swift
//  DND_Project
//
//  Created by Hayden Hoki on 3/17/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import UIKit

struct Key {
    static var name = "name"
    static var level = "level"
    static var castingTime = "casting_time"
    static var range = "range"
    static var duration = "duration"
    static var concentration = "concentration"
    static var materials = "material"
    static var components = "components"
    static var description = "desc"
    static var higherLevel = "higher_level"
    static var school = "school"
    static var ritual = "ritual"
}

class DetailSpellViewController: UIViewController {
    
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
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var castingTimeLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var componentsLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var materialsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        materialsButton.isHidden = true
        updateIndex()
        self.title = spellName
    }
    
}

extension DetailSpellViewController {
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
            self.spellName = selectedSpell[Key.name] as! String
            self.spellLevel = selectedSpell[Key.level] as! Int
            self.spellCastingTime = selectedSpell[Key.castingTime] as! String
            self.spellRange = selectedSpell[Key.range] as! String
            self.spellDuration = selectedSpell[Key.duration] as! String
            self.spellConcentration = selectedSpell[Key.concentration] as! String
            self.spellMaterial = selectedSpell[Key.materials] as? String
            var componentsArray = selectedSpell[Key.components] as? [String] ?? []
            for _ in componentsArray {
                self.spellComponents = "\(self.spellComponents) " + componentsArray.removeFirst()
            }
            var descriptionArray = selectedSpell[Key.description] as? [String] ?? []
            for _ in descriptionArray {
                self.spellDescription = "\(self.spellDescription) " + descriptionArray.removeFirst()
            }
            var higherLevelArray = selectedSpell[Key.higherLevel] as? [String] ?? []
            for _ in higherLevelArray {
                self.spellDescription = "\(self.spellDescription) \(higherLevelArray.removeFirst())"
            }
            var schoolObject = selectedSpell[Key.school] as! Dictionary<String, String>
            let ritualCast = selectedSpell[Key.ritual] as? String ?? "no"
            if ritualCast == "yes" {
                self.spellRitual = "(Ritual)"
            }
            self.spellSchool = schoolObject[Key.name] ?? "Fail"
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
                self.rangeLabel.text = "Range: \(self.spellRange)"
                self.componentsLabel.text = "Components: \(self.spellComponents)"
                self.durationLabel.text = "Duration: \(self.spellDuration)"
                self.descriptionTextView.text = self.spellDescription
            }
        }
    }
}
