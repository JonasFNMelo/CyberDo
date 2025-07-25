//
//  NivelComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

/// Componente que é responsavel por mostrar ao usuario seus Status
struct NivelComponent: View {
    
    @State var user: User
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            //Titulo do componente
            Text("Nivel \(Int(user.nivel))")
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
                    Text("\(Int(user.destreza))")
                    Text("\(Int(user.inteligencia))")
                    Text("\(Int(user.resistencia))")
                    Text("\(Int(user.vitalidade))")
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
                    Text("\(Int(user.sintonia))")
                    Text("\(Int(user.vigor))")
                    Text("\(Int(user.fe))")
                    Text("\(Int(user.forca))")
                }
            }
            .font(.sfMono())
            .foregroundColor(.accentColor)
        }
    }
}

//#Preview {
//    NivelComponent(user:   )
//}
