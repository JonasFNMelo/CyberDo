//
//  NivelComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

/// Componente que é responsavel por mostrar ao usuario seus Status
struct NivelComponent: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            //Titulo do componente
            Text("Nivel 5")
                .font(.sfMono(fontStyle: .title, fontWeight: .bold))
            
            // exibição dos atributos e dos seus respectiveis niveis 
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
    }
}

#Preview {
    NivelComponent()
}
