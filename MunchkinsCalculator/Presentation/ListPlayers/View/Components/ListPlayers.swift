//
//  ListPlayers.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 22/01/23.
//

import SwiftUI

struct ListPlayers: View {
    @Binding var players: [PlayerModel]

    var body: some View {
            Section("Players") {
                ForEach(players, id: \.id) { player in
                    if player.name != "Null" {
                    }
                }.onDelete{ index in
                    players.remove(atOffsets: index)
                }
                Button(action: {
                    players.append(PlayerModel(name: "LOCO"))
                }) {
                    HStack {
                        Image(systemName: "plus")
                    }
                }
            }
    }
}
