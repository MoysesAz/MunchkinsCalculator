//
//  PoinstBar.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 24/01/23.
//

import SwiftUI

struct PoinstBar: View {
    @Binding var powerChallengers: Int
    @Binding var powerMonster: Int
    @Binding var selectedFighterType: FightersEnum
    @Binding var isBattle: Bool

    var body: some View {
        if isBattle {
                HStack {
                    Image(systemName: "diamond.fill")
                        .foregroundColor(.green)
                    Image(systemName: "diamond.fill")
                        .foregroundColor(.blue)
                    Text(String(powerChallengers))
                    Spacer()
                    Text(String(powerMonster))
                    Image(systemName: "diamond.fill")
                        .foregroundColor(.red)

                }
            Divider()
            PickerFighter(selectedFighter: $selectedFighterType)

        }
    }
}
