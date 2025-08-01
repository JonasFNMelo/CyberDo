//
//  AchivementView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//

import SwiftUI

/// Tela responsavel por exibir ao usuario suas conquistas bloqueadas e desbloqueadas
struct AchivementView: View {
    
    //modelos que armazeram as datas que serao utilizadas no codigo
    @ObservedObject var todoModel = HomeViewModel()
    @ObservedObject var userModel = UserModel()
    @ObservedObject var metaModel = MetasModel()
    @ObservedObject var jsonData: DataWeb
    
    @Binding var isCompleteArray: [Bool]
    @State var user: User?
    @State var isComplete: Bool = true
    var body: some View {
        
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                CabecalhoConquistaComponent()
                    .padding(.top)
                
                VStack(spacing: 20){
//                    PikerConquistaComponent()
                    ForEach(Array(jsonData.conquistas.enumerated()), id: \.offset){ index, conquista in
                        ConquistaComponent(userModel: userModel,isComplete: isCompleteArray[index], conquista: conquista)
                    }
                }
            }
        }
        .onAppear{
            userModel.getUser()
            for usuario in userModel.users{
                user = usuario
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
    @Previewable @State var isCompleteArray: [Bool] = []
    @ObservedObject var jsonData = DataWeb()
    AchivementView(jsonData: jsonData, isCompleteArray: $isCompleteArray)
}
