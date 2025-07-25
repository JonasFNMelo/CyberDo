//
//  HomeView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//
import Foundation
import SwiftUI

/// Arquivo principal que junta todos os componentes da tela home
struct HomeView: View {
    
    @ObservedObject var toDoModel = HomeViewModel()
    @State var showModal = false
    @State var filtro: String = "Main"
    @State var toDos: [ToDo] = []
    @State var doneToDo: Bool = false
    
    var body: some View {
        
        ScrollView{
            
            VStack(spacing: 20){
                
                CabecalhoHomeComponent(showModal: $showModal)
                
                CalendarioComponent()
                
                PikerComponent(filtro: $filtro, toDos: $toDos, showModal: $showModal, doneToDo: $doneToDo)
                
                ForEach(toDos, id: \.self) { todos in
                    
                    QuestComponent(toDo: todos, colorComponent: .verde, doneToDo: $doneToDo)
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
