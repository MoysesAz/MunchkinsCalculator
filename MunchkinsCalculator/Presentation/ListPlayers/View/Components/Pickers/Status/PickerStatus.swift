//
//  PickerStatus.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 21/01/23.
//

import SwiftUI

struct PickerStatus: View {
    @Binding var selectedStatus: Int
    var systemName: String
    var statusRange: ClosedRange<Int>
    var color: Color = .blue

    var body: some View {
        VStack{
            Image(systemName: systemName)
                .foregroundColor(color)
            Picker("Please choose status", selection: $selectedStatus) {
                ForEach(statusRange, id: \.self) {
                    Text(String($0))
                }
            }
            .pickerStyle(.wheel)
            .frame(height: 150)
        }
    }
}





