//
//  CabecalhoProfileComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 16/07/25.
//

import SwiftUI

/// Cabeçalho
struct CabecalhoProfileComponent: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Profile")
                .font(.sfMono(fontStyle: .largeTitle,fontWeight: .bold))
        }
    }
}

#Preview {
    CabecalhoProfileComponent()
}
