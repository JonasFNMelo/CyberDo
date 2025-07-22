//
//  ProgressBarComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

/// Representação visual das metas
struct GraficoProgressoComponent: View {
    
    
    
    @State var currentXP: Double
    
    var titulo:String
    var maxXP: Double
    @State var colorBar: Color = .verde
    var categoria:String
    
    var progress: Double {
        min(currentXP / maxXP, 1.0)
    }
    
    var body: some View {
        
        VStack (alignment: .leading){
            
            //Titulo da meta
            Text(titulo)
                .font(.sfMono(fontStyle: .headline, fontWeight: .bold))
                .foregroundColor(colorBar)

            ZStack (alignment: .leading) {
                
                //Retangulo com baixa opacidade para mostrar progresso restante
                Rectangle()
                    .cornerRadius(100)
                    .opacity(0.2)
                    .foregroundColor(colorBar)
                    .frame(width: 380, height: 15)
                
                //Retangulo com baixa opacidade para mostrar progresso que ja foi realizado
                Rectangle()
                    .cornerRadius(100)
                    .foregroundColor(colorBar)
                    .frame(width: 380 * progress, height: 15)
            }
        }
        .onAppear{
            colorBar = DefineColor()
        }
    }
    func DefineColor() -> Color{
        switch categoria {
            case "Destreza":
                return Color.majenta
            case "Inteligência":
                return Color.azul
            case "Resistencia":
                return Color.vermelho
            case "Vitalidade":
                return Color.verde
            case "Sintonia":
                return Color.majenta
            case "Vigor":
                return Color.verde
            case "Fé":
                return Color.amarelo
            case "Força":
                return Color.vermelho
            
            default:
                return Color.verde

        }
    }
}


#Preview {
    GraficoProgressoComponent(currentXP: 5, titulo: "titulo da meta", maxXP: 10, categoria: "Fé")
}
