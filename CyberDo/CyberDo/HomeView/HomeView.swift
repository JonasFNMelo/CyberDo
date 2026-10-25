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
    @ObservedObject var metaModel: MetasModel
    @ObservedObject var userModel: UserModel
    
    @State var showModal = false
    @State var filtro: String = "Main"
    @State var toDos: [ToDo] = []
    @State var doneToDo: Bool = false
    
    var body: some View {
        
        ScrollView{
            
            VStack(spacing: 20){
                
                CabecalhoHomeComponent(showModal: $showModal)
                    .padding(.top)
                //                CalendarioComponent()
                
                PikerComponent(filtro: $filtro, toDos: $toDos, showModal: $showModal, doneToDo: $doneToDo)
                
                
                
                
                
                ForEach(toDos, id: \.self) { todos in
                    
                    QuestComponent(metaModel: metaModel, userModel: userModel, toDo: todos, colorComponent: .verde, doneToDo: $doneToDo)
                    //                    QuestComponent(toDo: todos, colorComponent: .verde, doneToDo: $doneToDo)
                }
                
                Spacer()
                
                NoQuestText(filtro: $filtro, toDos: $toDos, showModal: $showModal)
                
            }
            .padding()
        }
        .onDisappear{
            metaModel.getMeta()
            userModel.getUser()
            toDoModel.getToDo()
            
            for meta in metaModel.metas{
                metaModel.metaProgress(meta: meta)
                metaModel.deleteMeta(meta)
                
            }
            
            for user in userModel.users{
                userModel.adcionarToDos(user: user, toDos: toDoModel.toDos)
                userModel.adcionarMetas(user: user, metas: metaModel.metas)
                userModel.xpProgress(user: user)
                userModel.uparNivel(user: user, toDos: toDoModel.toDos)
                userModel.ofensivaProgress(user: user)
            }
        }
    }
}

#Preview {
    @ObservedObject var metaModel = MetasModel()
    @ObservedObject var userModel = UserModel()
    HomeView(metaModel: metaModel, userModel: userModel)
}
