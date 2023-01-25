//
//  CadastroView.swift
//  MunchkinsCalculator
//
//  Created by Moyses Miranda do Vale Azevedo on 24/01/23.
//

import SwiftUI

struct CadastroView: View {
    @Binding var name: String
    var body: some View {
        TextField("Nome do campeao", text: $name)
    }
}

