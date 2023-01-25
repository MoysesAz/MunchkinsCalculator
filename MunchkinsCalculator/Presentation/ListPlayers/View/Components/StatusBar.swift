//
//  StatusBarView.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 22/01/23.
//

import SwiftUI

struct StatusBar: View {
    @Binding var fighterType: FightersEnum
    @Binding var player: PlayerModel
    var color: Color = .blue
    var body: some View {
        HStack {
            PickerStatus(selectedStatus: $player.level, systemName: "shift.fill", statusRange: 0...30, color: color)
                if fighterType != .monster {
                    PickerStatus(selectedStatus: $player.gear, systemName: "shield.fill", statusRange: 0...60, color: color)
                }
                PickerStatus(selectedStatus: $player.sorcery, systemName: "bolt.fill", statusRange: -30...30, color: color)
        }
    }
}
