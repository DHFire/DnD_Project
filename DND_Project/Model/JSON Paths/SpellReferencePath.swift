//
//  SpellReferencePath.swift
//  DND_Project
//
//  Created by Hayden Hoki on 2/5/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation

class SpellReferencePath {

    static let spellPath = SpellReferencePath()
    
    func createSpellLibrary(completion: (([[String: Any]]) -> Void)? = nil) {
        
        let path = Bundle.main.path(forResource: "5e-SRD-Spells", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        
        do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let spellDictionary = jsonObject as? [Dictionary<String, Any>] {
                    
                    var spellArray: [[String: Any]] = []
                    
                    for object in spellDictionary {
                        spellArray.append(object)
                    }
                    
                    if let completion = completion {
                        completion(spellArray)
                    }
            }
        } catch {
            print("Spell JSON error: \(error).")
        }
 
    }
}
