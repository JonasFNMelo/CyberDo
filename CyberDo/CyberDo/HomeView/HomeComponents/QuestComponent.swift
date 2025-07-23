//
//  QuestComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

/// Representação visual das quests
struct QuestComponent: View {
    
    @ObservedObject var toDoModel = HomeViewModel()

    @State var toDo: ToDo
    @State var colorComponent: Color
    @State private var bio = ""

    @Binding var doneToDo: Bool
    
    
    var body: some View {
        if toDo.nome != nil{
            VStack{
                //Retangulo superior do componente
                Rectangle()
                    .frame(width: 345, height: 60)
                    .opacity(0)
                    .border(colorComponent)
                    .overlay{
                        VStack{
                            HStack {
                                //retangulo ao lado do nome/categoria (furutamente mudar para imagem)
                                Rectangle()
                                    .frame(width: 40, height: 40)
                                    .opacity(0)
                                    .border(colorComponent)
                                
                                //Nome e categoria da Quest
                                VStack (alignment: .leading){
                                    Text(toDo.nome!)
                                        .font(.sfMono(fontWeight: .bold))
                                    Text(toDo.categoria!)
                                        .font(.sfMono(fontStyle: .caption,fontWeight: .semibold))
                                }
                                
                                Spacer()
                                
                                //Botão para definir a conclusão da tarefa
                                Button {
                                    doneToDo.toggle()
                                    toDoModel.toggleDone(toDo)
                                } label: {
                                    if toDo.isDone == false{
                                        Rectangle()
                                            .frame(width: 40, height: 40)
                                            .opacity(0)
                                            .border(colorComponent)
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
                                
                                
                            }
                            .padding(17)
                            
                            
                            
                        }
                    }
                //Retanguo inferior que contem a descrição da Quest
                Rectangle()
                    .frame(width: 345, height: 100)
                    .opacity(0)
                    .border(colorComponent)
                    .overlay{
                        Text(toDo.descricao!)
                            .padding()
                        
                    }
                    .padding(.top, -9)
            }
            .onAppear{
                colorComponent = DefineColor()
            }
            .foregroundColor(colorComponent)
        }
    }
    func DefineColor() -> Color{
        switch toDo.categoria {
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

//#Preview {
//    var todo: ToDo
//    QuestComponent(toDo: todo, colorComponent: .verde)
//}
