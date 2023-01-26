//
//  ContentView.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 21/01/23.
//

import SwiftUI

struct ListPlayersView: View {
    @ObservedObject var controller: ListPlayerController = ListPlayerController()

    var body: some View {
        VStack{
            List {
                Section("Players") {
                    ForEach($controller.listPLayers, id: \.id) { player in
                        PlayerCell(player: player, color: .red)
                    }.onDelete{ index in
                        if controller.isBattle {
                            controller.finishedBattle()
                            controller.isBattle.toggle()
                        }
                        controller.listPLayers.remove(atOffsets: index)
                    }
                    Button(action: {
                        if controller.isBattle {
                            controller.finishedBattle()
                            controller.isBattle.toggle()
                        }
                        controller.listPLayers.append(PlayerModel(name: "New Player"))
                    }) {
                        HStack {
                            Text("Add")
                            Image(systemName: "plus")
                        }
                    }
                }
                if controller.isBattle {
                    Section("Powers") {
                        PoinstBar(powerChallengers: $controller.powerChallengers, powerMonster: $controller.powerMonster, isBattle: $controller.isBattle)
                    }
                }
                if !controller.listPLayers.isEmpty {
                    Section(controller.selectedFighterType.rawValue) {
                        VStack{
                            if controller.isBattle {
                                PickerFighter(selectedFighter: $controller.selectedFighterType)
                                Divider()
                            }
                            switch controller.selectedFighterType {
                            case .challenger:
                                PickerChallenger(selectedChallenger: $controller.selectedChallenger, players: $controller.listPLayers)
                                    .disabled(controller.isBattle)
                                    .opacity(controller.isBattle ? 0.5 : 1)
                                StatusBar(fighterType: $controller.selectedFighterType, player: $controller.listPLayers[controller.selectedChallenger], color: .green)
                            case .support:
                                PickerSupport(selectedChallenger: $controller.selectedChallenger, selectedSupport: $controller.selectedSupport, supports: $controller.listPLayers)
                                StatusBar(fighterType: $controller.selectedFighterType, player: $controller.listPLayers[controller.selectedSupport])
                                    .disabled(controller.verifySupportIsNull())
                                    .opacity(controller.verifySupportIsNull() ? 0.5 : 1)
                            case .monster:
                                Text("Monster")
                                StatusBar(fighterType: $controller.selectedFighterType, player: $controller.monster, color: .red)
                            }

                        }
                    }

                }

                Toggle(!controller.isBattle ? "Start Battle" : "Finish Battle", isOn: $controller.isBattle)
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                    .onTapGesture(){
                        controller.battle()
                    }
                    .disabled(controller.listPLayers.isEmpty)

            }
            .listStyle(.sidebar)

            .onChange(of: controller.listPLayers) { _ in
                if !controller.listPLayers.isEmpty {
                    controller.sumChallengers()
                }
            }
            .onChange(of: controller.selectedSupport) { _ in
                if controller.isBattle {
                    controller.sumChallengers()
                }
            }
            .onChange(of: controller.monster) { _ in
                if controller.isBattle{
                    controller.sumMonster()
                }
            }

        }

        //Custom Modifieis
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListPlayersView()
    }
}



extension String {
    var capitalizedSentence: String {
        // 1
        let firstLetter = self.prefix(1).capitalized
        // 2
        let remainingLetters = self.dropFirst().lowercased()
        // 3
        return firstLetter + remainingLetters
    }
}
