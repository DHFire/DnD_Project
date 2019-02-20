//
//  Monsters.swift
//  DND_Project
//
//  Created by Hayden Hoki on 2/15/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation

class MonstersReferencePath {
    
    static let equipmentPath = MonstersReferencePath()
    
    func getEquipment() -> Data{
        let path = Bundle.main.path(forResource: "5e-SRD-Monsters", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        return try! Data(contentsOf: url)
    }
}
