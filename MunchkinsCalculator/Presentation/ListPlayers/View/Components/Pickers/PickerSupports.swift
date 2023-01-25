//
//  PickerSupports.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 23/01/23.
//

import SwiftUI

struct PickerSupport: View {
    @Binding var selectedChallenger: Int
    @Binding var selectedSupport: Int
    @Binding var supports: [PlayerModel]

    var body: some View {
        Picker("Please choose Support", selection: $selectedSupport) {
            ForEach(0..<supports.count, id: \.self) {
                Text(supports[$0].name)
                    .opacity($0 == selectedChallenger ? 0.5 : 1)
            }
        }
        .pickerStyle(.wheel)
        .frame(height: 100)
        .onChange(of: selectedSupport) { _ in
            if selectedSupport == selectedChallenger {
                selectedSupport = supports.count - 1
            }
        }
    }
}
