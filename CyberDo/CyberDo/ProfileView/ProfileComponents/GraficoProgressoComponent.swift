//
//  ProgressBarComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

/// Representação visual das metas
struct GraficoProgressoComponent: View {
    
    
    @ObservedObject var toDoModel = HomeViewModel()
    @ObservedObject var metaModel = MetasModel()

    @State var colorBar: Color = .verde
    @State var toDos: [ToDo] = []
    
    var meta: Metas

    
    var body: some View {
        
        VStack (alignment: .leading){
            
            //Titulo da meta
            Text(meta.titulo ?? "")
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
                    .frame(width: 380 * min(meta.atual / meta.maximo, 1.0), height: 15)
            }
        }
        .onAppear{
            colorBar = DefineColor()
            toDos = filterToDo()
            metaModel.getMeta()
            metaModel.addToDoInMeta(meta: meta, toDos: toDos)
        }
    }
    func DefineColor() -> Color{
        switch meta.categoria {
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
    
    func filterToDo() -> [ToDo]{
        var todos: [ToDo] = []
        
        toDoModel.getToDo()
        for todo in toDoModel.toDos{
            if todo.categoria == meta.categoria && todo.isDone == true{
                todos.append(todo)
            }
        }
        return todos
    }
}


//#Preview {  
//    GraficoProgressoComponent()
//}
