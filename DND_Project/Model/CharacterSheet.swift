//
//  Character.swift
//  DND_Project
//
//  Created by Hayden Hoki on 2/11/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation

class Character {
    
    // MARK: - Declaration
    var characterName: String
    var playerName: String
    var background: String
    
    var race: CharacterRaces
    var characterClass: CharacterClasses
    
    var totalHealth: Int
    var currentHealth: Int
    var temporaryHP: Int
    var armorClass: Int
    var initiative: Int
    var movement: Int
    
    var strengthScore: Int
    var dexterityScore: Int
    var constitutionScore: Int
    var intelligenceScore: Int
    var wisdomScore: Int
    var charismaScore: Int
    
    var strengthModifier: Int
    var dexterityModifier: Int
    var constitutionModifier: Int
    var intelligenceModifier: Int
    var wisdomModifier: Int
    var charismaModifier: Int
    
    var proficiencyBonus: Int
    
    var spellList: [String]
    
    // MARK: - Initializer
    init() {
        
    }
    
    // MARK: - Enums
    enum CharacterClasses {
        case Barbarian, Bard, Cleric, Druid, Fighter, Monk, Paladin, Ranger, Rogue, Sorcerer, Warlock, Wizard
    }
    enum CharacterRaces: String {
        case Dwarf, Elf, Halfling, HalfElf, HalfOrc, Human, Dragonborn, Gnome, Tiefling
    }
    enum SavingThrows {
        case Strength, Dexterity, Constitution, Intelligence, Wisdom, Charisma
    }
    enum Skills: String {
        case Acrobatics, AnimalHandling, Arcana, Athletics, Deception, History, Insight, Intimidation, Investigation, Medicine, Nature, Perception, Performance, Persuasion, Religion, SlightOfHand, Stealth, Survival
    }
    
}
