//
//  XpBarComponente.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 28/07/25.
//

import SwiftUI

struct XpBarComponente: View {
    
    //    @Binding var user: User
    var colorBar: Color = .verde
    @ObservedObject var userModel: UserModel
    @State var user: User?
    var body: some View {
        
        VStack (alignment: .leading){
            
            ZStack (alignment: .leading) {
                
                //Retangulo com baixa opacidade para mostrar progresso restante
                Rectangle()
                    .cornerRadius(100)
                    .opacity(0.2)
                    .foregroundColor(colorBar)
                    .frame(width: 380, height: 15)
                
                //Retangulo com alta opacidade para mostrar progresso que ja foi realizado
                Rectangle()
                    .cornerRadius(100)
                    .foregroundColor(colorBar)
                    .frame(width: 380 * min((user?.xp ?? 1) / (user?.maxXp ?? 1), 1), height: 15)
            }
        }
        .onAppear{
            user = userModel.users[0]
        }
    }
}


