//
//  MetasComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

/// Componente onde o usuario pode acompanhar e criar novas metas
struct MetasComponent: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            
            //Titulo do component
            Text("Metas")
                .font(.sfMono(fontStyle: .title, fontWeight: .bold))
               
            //metas atuais (mudar para coreData)
            GraficoProgressoComponent(currentXP: 5, maxXP: 10, colorBar: .verde)
            
            GraficoProgressoComponent(currentXP: 9, maxXP: 10, colorBar: .majenta)
            
            GraficoProgressoComponent(currentXP: 2, maxXP: 10, colorBar: .amarelo)
        }
    }
}

#Preview {
    MetasComponent()
}
