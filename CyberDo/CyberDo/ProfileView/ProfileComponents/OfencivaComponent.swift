//
//  OfencivaComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI
import Charts

/// Componente que vai medir graficamente a ofenciva de um jogador 
struct OfencivaComponent: View {
    
    @State var currentXP: Double
    var maxXP: Double
    
    var progress: Double {
        min(currentXP / maxXP, 1.0)
    }
    
    var body: some View {
        ZStack {
           // Circulo com baixa opacidade, para mostrar quanto progresso falta
            Circle()
                .trim(from: 0.0, to: 0.5)
                .stroke(lineWidth: 10)
                .opacity(0.2)
                .foregroundColor(.vermelho)
                .rotationEffect(.degrees(180))
                .frame(width: 400,height: 270)

            // Circulo com alta opacidade, para mostrar quanto progresso ja foi concluido
            Circle()
                .trim(from: 0.0, to: 0.5 * progress)
                .stroke(lineWidth: 10)
                .foregroundColor(.vermelho)
                .rotationEffect(.degrees(180))
            
            // texto principal 
            Text("OFENSIVA")
                .font(.sfMono(fontStyle: .title, fontWeight: .bold))
                .foregroundColor(.vermelho)
                .padding(.bottom, 20)
            
//            Rectangle()
//                .frame(width: 280, height: 270)
                

        }
        .frame(width: 280, height: 270)
    }
}

#Preview {
    OfencivaComponent(currentXP: 5, maxXP: 10)
}
