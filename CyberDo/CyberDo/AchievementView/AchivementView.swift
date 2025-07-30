//
//  AchivementView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//

import SwiftUI

/// Tela responsavel por exibir ao usuario suas conquistas bloqueadas e desbloqueadas
struct AchivementView: View {
    
    @ObservedObject var todoModel = HomeViewModel()
    @ObservedObject var userModel = UserModel()
    @ObservedObject var metaModel = MetasModel()
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                CabecalhoConquistaComponent()
                    .padding(.top)

                VStack(spacing: 20){
                    
                    PikerConquistaComponent()
                    
                    ConquistaComponent(colorComponent: .verde)
                    
                    ConquistaComponent(colorComponent: .majenta)
                    
                    ConquistaComponent(colorComponent: .azul)
                    
                    ConquistaComponent(colorComponent: .vermelho)
                    
                    
                }
            }
        }
        .onDisappear{
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
            
            for meta in metaModel.metas{
                metaModel.metaProgress(meta: meta)
                metaModel.deleteMeta(meta)
                
            }
        }

    }
}

#Preview {
    AchivementView()
}
