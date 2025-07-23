//
//  PikerComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 16/07/25.
//

import SwiftUI

/// Componente responsavel por filtrar as quests que aparecem na tela com base em algumas categorias
struct PikerComponent: View {
    
    @Binding var filtro: String
    @Binding var toDos: [ToDo]
    @ObservedObject var toDoModel = HomeViewModel()
    @Binding var showModal: Bool
    @Binding var doneToDo: Bool
    
    var body: some View {
        
        Grid(horizontalSpacing: 40){
            GridRow{
                //botão Main
                Button {
                    filtro = "Main"
                    filtrarToDo()
                } label: {
                    if filtro == "Main" {
                        Text("Main")
                            .foregroundColor(.accent)
                    }
                    if filtro != "Main" {
                        Text("Main")
                            .foregroundColor(.gray)
                    }
                }
                
                Text("|")
                
                //botão Side
                Button {
                    filtro = "Side"
                    filtrarToDo()
                } label: {
                    if filtro == "Side" {
                        Text("Side")
                            .foregroundColor(.accent)
                    }
                    if filtro != "Side" {
                        Text("Side")
                            .foregroundColor(.gray)
                    }
                }
                
                Text("|")
                
                //botão Done
                Button {
                    filtro = "Done"
                    filtrarToDo()
                } label: {
                    if filtro == "Done" {
                        Text("Done")
                            .foregroundColor(.accent)
                    }
                    if filtro != "Done" {
                        Text("Done")
                            .foregroundColor(.gray)
                    }
                }
            }
            .font(.sfMono(fontStyle: .headline,fontWeight: .bold))
        }
        .onAppear(){
            filtrarToDo()
        }
        .onChange(of: showModal){
            filtrarToDo()
        }
        .onChange(of: doneToDo){
            filtrarToDo()
        }
        .padding(10)
    }
    
    func filtrarToDo(){
        toDos.removeAll()
        toDoModel.getToDo()
        for tarefa in toDoModel.toDos{
            if tarefa.prioridade == filtro && tarefa.isDone == false{
                toDos.append(tarefa)
            }
            
            if filtro == "Done"{
                if tarefa.isDone == true{
                    toDos.append(tarefa)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var showModal = false
    @Previewable @State var doneToDo = false
    @Previewable @State var filtro = "Main"
    @Previewable @State var toDos: [ToDo] = []
    PikerComponent(filtro: $filtro, toDos: $toDos, showModal: $showModal, doneToDo: $doneToDo)
}
