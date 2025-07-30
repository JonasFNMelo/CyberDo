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
    @ObservedObject var jsonData: DataWeb
    
    @Binding var isCompleteArray: [Bool]
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
            
            isCompleteToggle(userModel: userModel, conquistas: jsonData.conquistas)
            
        }
        .onAppear{
            profileInicializer()
        }
        .refreshable {
            profileInicializer()
        }
        .onDisappear{
            userModel.getUser()
            isCompleteToggle(userModel: userModel, conquistas: jsonData.conquistas)
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
    
    func isCompleteToggle(userModel: UserModel, conquistas: [Conquista]){
        isCompleteArray.removeAll()

        userModel.getUser()
        
        let user = userModel.users.first
        
        for  conquista in conquistas{
            switch conquista.categoria {
            case "Destreza":
                //            if conquista.numMax <= Int(user.destreza){
                if conquista.numMax <= Int(user?.destreza ?? -1){
                    isCompleteArray.append(true)
                }else{
                    isCompleteArray.append(false)
                }
            case "Inteligência":
                //            if conquista.numMax <= Int(user.inteligencia){
                if conquista.numMax <= Int(user?.inteligencia ?? -1){
                    isCompleteArray.append(true)

                }else{
                    isCompleteArray.append(false)
                }
            case "Resistencia":
                //            if conquista.numMax <= Int(user.resistencia){
                if conquista.numMax <= Int(user?.resistencia ?? -1){
                    isCompleteArray.append(true)

                }else{
                    isCompleteArray.append(false)
                }
            case "Vitalidade":
                //            if conquista.numMax <= Int(user.vitalidade){
                if conquista.numMax <= Int(user?.vitalidade ?? -1){
                    isCompleteArray.append(true)

                }else{
                    isCompleteArray.append(false)
                }
            case "Sintonia":
                //            if conquista.numMax <= Int(user.sintonia){
                if conquista.numMax <= Int(user?.sintonia ?? -1){
                    isCompleteArray.append(true)
                    
                }else{
                    isCompleteArray.append(false)
                }
            case "Vigor":
                //            if conquista.numMax <= Int(user.vigor){
                if conquista.numMax <= Int(user?.vigor ?? -1){
                    isCompleteArray.append(true)

                }else{
                    isCompleteArray.append(false)
                }
            case "Fé":
                //            if conquista.numMax <= Int(user.fe){
                if conquista.numMax <= Int(user?.fe ?? -1){
                    isCompleteArray.append(true)

                }else{
                    isCompleteArray.append(false)
                }
            case "Força":
                //            if conquista.numMax <= Int(user.forca){
                if conquista.numMax <= Int(user?.forca ?? -1){
                    isCompleteArray.append(true)

                }else{
                    isCompleteArray.append(false)
                }
                
            default:
                isCompleteArray.append(false)
            }
        }
    }
}

//#Preview {
//    @ObservedObject var todoModel = HomeViewModel()
//    @ObservedObject var metaModel = MetasModel()
//    @ObservedObject var userModel = UserModel()
//    ProfileView(todoModel:todoModel , metaModel: metaModel, userModel: userModel)
//    
//}
