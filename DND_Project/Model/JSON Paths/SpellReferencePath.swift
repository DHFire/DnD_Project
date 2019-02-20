//
//  SpellReferencePath.swift
//  DND_Project
//
//  Created by Hayden Hoki on 2/5/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation

class SpellReferencePath {

    static let sharedController = SpellReferencePath()
    
    func getSpells() -> Data{
        let path = Bundle.main.path(forResource: "5e-SRD-Spells", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        return try! Data(contentsOf: url)
    }
}
