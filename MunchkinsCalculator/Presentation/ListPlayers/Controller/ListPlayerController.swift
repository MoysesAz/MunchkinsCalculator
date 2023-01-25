//
//  ListPlayerController.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 21/01/23.
//

import Foundation

final class ListPlayerController: ObservableObject {
    let fighters:  [FightersEnum] = FightersEnum.allCases

    @Published var listPLayers: [PlayerModel] = [
    ]

    @Published var monster: PlayerModel = PlayerModel(name: "Monster", level: 0)

    @Published var powerChallengers: Int = 0
    @Published var powerMonster: Int = 0

    @Published var selectedChallenger: Int = 0
    @Published var selectedSupport: Int = 0
    @Published var selectedFighterType: FightersEnum = .challenger
    @Published var isBattle: Bool = false

    var countPlayers: Int {
        get { return listPLayers.count }
    }

    func addSupportNull() {
        listPLayers += [PlayerModel(name: "Null", level: 0)]
        selectedSupport = listPLayers.count - 1
    }

    func removeSupportNull() {
        listPLayers.remove(at: listPLayers.count - 1)
        selectedSupport = 0
    }

    func sumChallengers() {
        let challenger = listPLayers[selectedChallenger]
        let support = listPLayers[selectedSupport]
        let challengerPower = challenger.level + challenger.gear + challenger.sorcery
        let supportPower = support.level + support.gear + support.sorcery
        powerChallengers =  challengerPower + supportPower
    }

    func sumMonster() {
        powerMonster = monster.level + monster.sorcery
    }

    func resetMonster () {
        monster.level = 0
        monster.gear = 0
        monster.sorcery = 0
    }

    func removeAllPlayersSorceries() {
        listPLayers = listPLayers.map {
            var player = $0
            player.sorcery = 0
            return player
        }
    }

    func verifySupportIsNull() -> Bool {
        return listPLayers.count - 1 == selectedSupport ? true : false
    }


    func startBattle() {
        addSupportNull()
        sumChallengers()
    }

    func finishedBattle() {
        removeSupportNull()
        removeAllPlayersSorceries()
        resetMonster()
    }



}
