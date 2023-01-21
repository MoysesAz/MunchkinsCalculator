//
//  ListPlayerController.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 21/01/23.
//

import Foundation

final class ListPlayerController {
    private var listPLayers: [PlayerModel] = []
    private var challenger: PlayerModel?
    private var support: PlayerModel?
    private var battle: Bool = false

    var countPlayers: Int {
        get { return listPLayers.count }
    }

    func addPlayer(name: String) {
        let player = PlayerModel(name: name, level: 1, gear: 0, sorcery: 0)
        listPLayers.append(player)
    }
}
