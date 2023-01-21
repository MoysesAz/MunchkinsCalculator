//
//  PlayerModel.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 21/01/23.
//

import Foundation

struct PlayerModel: Identifiable {
    var id = UUID()
    var name: String
    var level: Int
    var gear: Int
    var sorcery: Int

    init(name: String, level: Int, gear: Int, sorcery: Int) {
        self.name = name
        self.level = level
        self.gear = gear
        self.sorcery = sorcery
    }
}
