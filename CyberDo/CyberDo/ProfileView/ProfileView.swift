//
//  ProfileView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//

import SwiftUI

/// Tela que mostra o status do player, sua evolucao, metas e ofenciva 
struct ProfileView: View {
    var body: some View {
        ScrollView{
            
            VStack(spacing: 50){
                
                HStack(){
                    CabecalhoProfileComponent()
                    Spacer()
                }
                
                OfencivaComponent(currentXP: 10, maxXP: 30)
                
                NivelComponent()
                    .padding(.top, -130)
                
                MetasComponent()
                
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
    
}
