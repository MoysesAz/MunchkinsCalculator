//
//  PlayerModel.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 21/01/23.
//

import Foundation

struct PlayerModel: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var level: Int
    var gear: Int
    var sorcery: Int

    init(name: String, level: Int = 1, gear: Int = 0, sorcery: Int = 0) {
        self.name = name
        self.level = level
        self.gear = 0
        self.sorcery = sorcery
    }
}
