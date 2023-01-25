//
//  PickerChallenger.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 21/01/23.
//

import SwiftUI

struct PickerChallenger: View {
    @Binding var selectedChallenger: Int
    @Binding var players: [PlayerModel]

    var body: some View {
            Picker("Please choose challenger", selection: $selectedChallenger) {
                ForEach(0..<players.count, id: \.self) {
                    Text(players[$0].name)
                }
            }
            .pickerStyle(.wheel)
            .frame(height: 100)
    }
}
