//
//  ProfileView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//

import SwiftUI

/// Tela que mostra o status do player, sua evolucao, metas e ofenciva
struct ProfileView: View {
    
    @ObservedObject var todoModel: HomeViewModel
    @ObservedObject var metaModel: MetasModel
    @ObservedObject var userModel: UserModel
    
    @State var showModal = false
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 50){
                
                HStack(){
                    CabecalhoProfileComponent()
                        .padding(.top)
                    Spacer()
                }
                
                
                OfencivaComponent(userModel: userModel)
                
                
                NivelComponent(userModel: userModel)
                    .padding(.top, -130)
                
                
                MetasComponent(showModal: $showModal, metaModel: metaModel, userModel: userModel)
                
            }
            
        }
        .onChange(of: showModal){
            profileInicializer()
        }
        .onAppear{
            profileInicializer()
        }
        .refreshable {
            profileInicializer()
        }
        .padding()

    }
    func profileInicializer(){
        metaModel.getMeta()
        userModel.getUser()
        todoModel.getToDo()
        
        for user in userModel.users{
            userModel.adcionarToDos(user: user, toDos: todoModel.toDos)
            userModel.adcionarMetas(user: user, metas: metaModel.metas)
            userModel.xpProgress(user: user)
            userModel.uparNivel(user: user, toDos: todoModel.toDos)
            userModel.ofensivaProgress(user: user)
        }
        
        userModel.getUser()
        
        for meta in metaModel.metas{
            metaModel.metaProgress(meta: meta)
            metaModel.deleteMeta(meta)
        }
    }
}

#Preview {
    @ObservedObject var todoModel = HomeViewModel()
    @ObservedObject var metaModel = MetasModel()
    @ObservedObject var userModel = UserModel()
    ProfileView(todoModel:todoModel , metaModel: metaModel, userModel: userModel)
    
}
