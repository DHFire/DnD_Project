//
//  MonstersReferencePath.swift
//  DND_Project
//
//  Created by Hayden Hoki on 2/15/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation

class MonsterReferencePath {
    
    static let monsterPath = MonsterReferencePath()
    
    func createMonsterLibrary(completion: (([[String: Any]]) -> Void)? = nil) {
        
        let path = Bundle.main.path(forResource: "5e-SRD-Monsters", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let monsterDictionary = jsonObject as? [Dictionary<String, Any>] {
                
                var monsterArray: [[String: Any]] = []
                
                for object in monsterDictionary {
                    monsterArray.append(object)
                }
                
                if let completion = completion {
                    
                    completion(monsterArray)
                }
            }
        } catch {
            print("Monster JSON error: \(error).")
        }
        
    }
}
