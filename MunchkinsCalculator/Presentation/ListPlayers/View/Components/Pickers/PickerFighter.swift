//
//  PickerFighter.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 22/01/23.
//

import SwiftUI

struct PickerFighter: View {
    let fighters:  [FightersEnum] = FightersEnum.allCases
    @Binding var selectedFighter: FightersEnum

    var body: some View {
        Picker("Please choose challenger", selection: $selectedFighter) {
            ForEach(fighters, id: \.self) { fighter in
                Text(fighter.rawValue)
            }
        }
        .pickerStyle(.segmented)
        .frame(height: 30)
    }
}
