//
//  CharacterSheet.swift
//  DND_Project
//
//  Created by Hayden Hoki on 2/11/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation

class CharacterSheet {
    
    // MARK: - Character Stuff
    var characterName: String
    var playerName: String
    var background: Backgrounds
    var level: Int
    var xp: Int?
    var characterRace: CharacterRaces
    var characterClass: CharacterClasses
    var passivePerception: Int
    var proficiencyBonus: Int
    var spellList: [String]? // [Spells]
    var inventory: [String]
    var initiative: Int
    var movement: Int
    
    // MARK: - Health/Armor
    var totalHealth: Int
    var currentHealth: Int
    var temporaryHP: Int
    var armorClass: Int
    
    // MARK: - Ability Scores
    var strengthScore: Int
    var dexterityScore: Int
    var constitutionScore: Int
    var intelligenceScore: Int
    var wisdomScore: Int
    var charismaScore: Int
    
    // MARK: - Ability Modifiers
    var strengthModifier: Int
    var dexterityModifier: Int
    var constitutionModifier: Int
    var intelligenceModifier: Int
    var wisdomModifier: Int
    var charismaModifier: Int
    
    // MARK: - Money
    var copper: Int
    var silver: Int
    var elantrium: Int
    var gold: Int
    var platinum: Int
    
    // MARK: - Character Traits
    var personality: String
    var ideals: String
    var bonds: String
    var flaws: String
    
    // MARK: - Initializer
    init(characterName: String, playerName: String, background: Backgrounds, level: Int, xp: Int?, characterRace: CharacterRaces, characterClass: CharacterClasses, totalHealth: Int, armorClass: Int, strengthScore: Int, dexterityScore: Int, constitutionScore: Int, intelligenceScore: Int, wisdomScore: Int, charismaScore: Int, strengthModifier: Int, dexterityModifier: Int, constitutionModifier: Int, intelligenceModifier: Int, wisdomModifier: Int, charismaModifier: Int) {
        self.characterName = characterName
        self.playerName = playerName
        self.background = background
        self.level = level
        self.xp = xp
        self.characterRace = characterRace
        self.characterClass = characterClass
        self.totalHealth = totalHealth
        currentHealth = self.totalHealth
        temporaryHP = 0
        self.armorClass = armorClass
        initiative = dexterityModifier
        movement = 0
        self.strengthScore = strengthScore
        self.dexterityScore = dexterityScore
        self.constitutionScore = constitutionScore
        self.intelligenceScore = intelligenceScore
        self.wisdomScore = wisdomScore
        self.charismaScore = charismaScore
        self.strengthModifier = strengthModifier
        self.dexterityModifier = dexterityModifier
        self.constitutionModifier = constitutionModifier
        self.intelligenceModifier = intelligenceModifier
        self.wisdomModifier = wisdomModifier
        self.charismaModifier = charismaModifier
        passivePerception = 10
        proficiencyBonus = 2
        spellList = []
        inventory = []
        copper = 0
        silver = 0
        elantrium = 0
        gold = 0
        platinum = 0
        personality = ""
        ideals = ""
        bonds = ""
        flaws = ""
    }
    
    // MARK: - Enums
    enum Backgrounds {
        case Acolyte, Sage, Hermit, GuildArtisan, Entertainer, FolkHero, Gladiator, Charlatan, Criminal, Noble, Outlander, Knight, Sailor, Soldier, Spy, GuildMerchant, Urchin, Pirate
    }
    enum CharacterClasses {
        case Barbarian, Bard, Cleric, Druid, Fighter, Monk, Paladin, Ranger, Rogue, Sorcerer, Warlock, Wizard
    }
    enum CharacterRaces {
        case Dwarf, Elf, Halfling, HalfElf, HalfOrc, Human, Dragonborn, Gnome, Tiefling
    }
    enum Languages {
        case Abyssal, Common, Dwarvish, Elvish, Giant, Gnomish, Goblin, Halfling, Orc, Celestial, Draconic, DeepSpeech, Infernal, Primordial, Sylvan, Undercommon
    }
    enum SavingThrows {
        case Strength, Dexterity, Constitution, Intelligence, Wisdom, Charisma
    }
    enum Skills {
        case Acrobatics, AnimalHandling, Arcana, Athletics, Deception, History, Insight, Intimidation, Investigation, Medicine, Nature, Perception, Performance, Persuasion, Religion, SlightOfHand, Stealth, Survival
    }
    
}

