//
//  ProfileView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//

import SwiftUI

/// Tela que mostra o status do player, sua evolucao, metas e ofenciva 
struct ProfileView: View {
    
    @ObservedObject var metaModel = MetasModel()
    @ObservedObject var userModel = UserModel()
    var body: some View {
        ScrollView{
            
            VStack(spacing: 50){
                
                HStack(){
                    CabecalhoProfileComponent()
                    Spacer()
                }
                
                
                ForEach(userModel.users) { user in
                    OfencivaComponent(currentXP: user.ofensiva, maxXP: 30)

                    NivelComponent(user: user)
                        .padding(.top, -130)
                }
                
                
                MetasComponent(metaModel: metaModel)
                
            }
            .padding()
            .onAppear{
                metaModel.getMeta()
                userModel.getUser()
                for user in userModel.users{
                    print(user.nivel)

                }
            }
        }
    }
}

#Preview {
    ProfileView()
    
}
