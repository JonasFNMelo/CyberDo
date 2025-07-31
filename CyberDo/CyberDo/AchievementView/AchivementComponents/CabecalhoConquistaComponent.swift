//
//  CabecalhoConquistaComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 16/07/25.
//

import SwiftUI

/// Cabeçalho
struct CabecalhoConquistaComponent: View {
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Conquista")
                .font(.sfMono(fontStyle: .largeTitle,fontWeight: .bold))
        }
        .padding()
    }
}

#Preview {
    CabecalhoConquistaComponent()
}
