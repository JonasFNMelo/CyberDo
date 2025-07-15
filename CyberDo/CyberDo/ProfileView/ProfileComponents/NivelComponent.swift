//
//  NivelComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

struct NivelComponent: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Nivel 5")
                .font(.sfMono(fontStyle: .title, fontWeight: .bold))
            
            HStack (spacing: 10){
                VStack(alignment: .leading, spacing: 10) {
                    Text("Destreza")
                    Text("Inteligencia")
                    Text("Resistencia")
                    Text("Vitalidade")
                }
                Spacer()

                VStack(alignment: .leading, spacing: 10) {
                    Text("0")
                    Text("0")
                    Text("0")
                    Text("0")
                }
                Spacer()
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Sintonia")
                    Text("Vigor")
                    Text("Fé")
                    Text("Força")
                    
                }
                Spacer()

                VStack(alignment: .leading, spacing: 10) {
                    Text("0")
                    Text("0")
                    Text("0")
                    Text("0")
                }
            }
            .font(.sfMono())
            .foregroundColor(.accentColor)
        }
        .edgesIgnoringSafeArea([])
    }
}

#Preview {
    NivelComponent()
}
