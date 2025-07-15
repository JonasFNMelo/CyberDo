//
//  OfencivaComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI
import Charts

struct OfencivaComponent: View {
    
    @State var currentXP: Double
    var maxXP: Double
    
    var progress: Double {
        min(currentXP / maxXP, 1.0)
    }
    
    var body: some View {
        ZStack {
           
            Circle()
                .trim(from: 0.0, to: 0.5)
                .stroke(lineWidth: 10)
                .opacity(0.2)
                .foregroundColor(.vermelho)
                .rotationEffect(.degrees(180))
                .frame(width: 400,height: 270)

           
            Circle()
                .trim(from: 0.0, to: 0.5 * progress)
                .stroke(lineWidth: 10)
                .foregroundColor(.vermelho)
                .rotationEffect(.degrees(180))
            
            
            Text("OFENCIVA")
                .font(.sfMono(fontStyle: .title, fontWeight: .bold))
                .foregroundColor(.vermelho)
                .padding(.bottom, 20)
            
            
        }
        .frame(width: 200, height: 100)
    }
}

#Preview {
    OfencivaComponent(currentXP: 5, maxXP: 10)
}
