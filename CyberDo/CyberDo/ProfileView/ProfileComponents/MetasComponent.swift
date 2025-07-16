//
//  MetasComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

struct MetasComponent: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            
            Text("Metas")
                .font(.sfMono(fontStyle: .title, fontWeight: .bold))
               
            
            GraficoProgressoComponent(currentXP: 5, maxXP: 10, colorBar: .verde)
            
            GraficoProgressoComponent(currentXP: 9, maxXP: 10, colorBar: .majenta)
            
            GraficoProgressoComponent(currentXP: 2, maxXP: 10, colorBar: .amarelo)
        }
    }
}

#Preview {
    MetasComponent()
}
