//
//  PlayerCell.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 21/01/23.
//

import SwiftUI

struct PlayerCell: View {
    @Binding var player: PlayerModel
    let color: Color

    var body: some View {
        if !(player.name == "Null") {
            VStack {
                HStack {
                    TextField(player.name, text: $player.name)
                    Spacer()
                    Image(systemName: "shift.fill")
                        .foregroundColor(.green)
                    Text(String(player.level))
                    Image(systemName: "shield.fill")
                        .foregroundColor(.green)
                    Text(String(player.gear))
                }
            }
        }
    }
}

