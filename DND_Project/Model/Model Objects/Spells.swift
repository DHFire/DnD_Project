//
//  Spells.swift
//  DND_Project
//
//  Created by Hayden Hoki on 2/8/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation

struct Spell: Decodable {
    
    // MARK: - Objects
    var spells: [String] = []
    var spellIndex: Int
    var spellLevel: Int
    var spellName: String
    var spellRange: String
    var spellRitual: String
    var spellSchool: String
    var spellDuration: String
    var spellMaterials: String
    var spellComponents: String
    var spellCastingTime: String
    var spellHigherLevel: String
    var spellDesc: String
    var spellConcentration: String
    
    // MARK: - Coding Keys
    enum CodingKeys: CodingKey {
        case name
        case desc
        case index
        case range
        case level
        case school
        case ritual
        case duration
        case material
        case components
        case higher_level
        case casting_time
        case concentration
    }
    
    // MARK: - Initializer
    init(from decoder: Decoder) throws {
        let baseContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.spellIndex = try baseContainer.decode(Int.self, forKey: CodingKeys.index)
        self.spellLevel = try baseContainer.decode(Int.self, forKey: CodingKeys.level)
        self.spellName = try baseContainer.decode(String.self, forKey: CodingKeys.name)
        self.spellDesc = try baseContainer.decode(String.self, forKey: CodingKeys.desc)
        self.spellRange = try baseContainer.decode(String.self, forKey: CodingKeys.range)
        self.spellRitual = try baseContainer.decode(String.self, forKey: CodingKeys.ritual)
        self.spellSchool = try baseContainer.decode(String.self, forKey: CodingKeys.school)
        self.spellDuration = try baseContainer.decode(String.self, forKey: CodingKeys.duration)
        self.spellMaterials = try baseContainer.decode(String.self, forKey: CodingKeys.material)
        self.spellComponents = try baseContainer.decode(String.self, forKey: CodingKeys.components)
        self.spellCastingTime = try baseContainer.decode(String.self, forKey: CodingKeys.casting_time)
        self.spellHigherLevel = try baseContainer.decode(String.self, forKey: CodingKeys.higher_level)
        self.spellConcentration = try baseContainer.decode(String.self, forKey: CodingKeys.concentration)
    }
}

// If I really wanted to do something with this code then I would have done so already. I don't really know what I want to do with this. I want to be able to type faster but my brain cannot comprehend the letters fast enough so maybe I just need to turn off the brain and jsut let my fingers go.....
