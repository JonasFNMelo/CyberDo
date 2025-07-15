//
//  ProgressBarComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

struct GraficoProgressoComponent: View {
    
    
    
    @State var currentXP: Double
    
    var maxXP: Double
    
    var colorBar: Color
    
    var progress: Double {
        min(currentXP / maxXP, 1.0)
    }
    
    var body: some View {
        
        VStack (alignment: .leading){
            
            Text("Fazer x quests da categoria 2")
                .font(.sfMono(fontStyle: .headline, fontWeight: .bold))
                .foregroundColor(colorBar)

            ZStack (alignment: .leading) {
                
                Rectangle()
                    .cornerRadius(100)
                    .opacity(0.2)
                    .foregroundColor(colorBar)
                    .frame(width: 380, height: 15)
                
                Rectangle()
                    .cornerRadius(100)
                    .foregroundColor(colorBar)
                    .frame(width: 380 * progress, height: 15)
            }
        }
    }
}


#Preview {
    GraficoProgressoComponent(currentXP: 5, maxXP: 10, colorBar: .verde)
}
