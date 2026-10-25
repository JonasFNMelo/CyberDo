//
//  QuestComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

/// Componente que possibilita a viasualização das conquistas
struct ConquistaComponent: View {
    
    @ObservedObject var userModel: UserModel
    var isComplete: Bool
    @State var colorComponent: Color = Color(.verde)
    
    let conquista: Conquista
    
    var body: some View {
        
        VStack{
            Rectangle()
                .frame(width: 345, height: 60)
                .opacity(0)
                .border(colorComponent)
                .overlay{
                    VStack{
                        HStack {
                            
                            Image(systemName: "trophy.fill")
                                .font(.title)
                            
                            VStack (alignment: .leading){
                                Text(conquista.nome)
                                    .font(.sfMono(fontWeight: .bold))
                                Text(conquista.categoria)
                                    .font(.sfMono(fontStyle: .caption,fontWeight: .semibold))
                            }
                            
                            Spacer()
                            
                            
                            if isComplete == false{
                                Image(systemName: "lock")
                                    .foregroundColor(colorComponent)
                                    .font(.title)
                            } else {
                                ZStack{
                                    Rectangle()
                                        .frame(width: 40, height: 40)
                                        .border(colorComponent)
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.checkMark)
                                        .bold()
                                        .font(.title2)
                                }
                            }
                        }
                        .padding(17)
                    }
                }
            
            Rectangle()
                .frame(width: 345, height: 100)
                .opacity(0)
                .border(colorComponent)
                .overlay{
                    Text(conquista.descricao)
                        .padding()
                    
                }
                .padding(.top, -9)
        }
        .task {
            
        }
        .onAppear{
            colorComponent = DefineColor()
        }
        .foregroundColor(colorComponent)
    }
    
    /// Função que define a cor da conquista
    /// - Returns: Cor que vai ser utilizada na conquista
    func DefineColor() -> Color{
        switch conquista.categoria {
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
//
//#Preview {
//    @Previewable @State var isComplete = false
//    @ObservedObject var userModel = UserModel()
//    var conquista = Conquista(nome: "Nome", descricao: "Descreicao", categoria: "Vigor", numMax: 10)
//    ConquistaComponent
//}
