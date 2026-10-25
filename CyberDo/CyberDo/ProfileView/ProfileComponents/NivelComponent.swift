//
//  NivelComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

/// Componente que é responsavel por mostrar ao usuario seus Status
struct NivelComponent: View {
    
    @ObservedObject var userModel: UserModel
    @State var user: User?
    var body: some View {
        
            VStack(alignment: .leading, spacing: 10) {
                
                HStack{
                    //Titulo do componente
                    Text("Nivel \(Int(user?.nivel ?? -1))")
                        .font(.sfMono(fontStyle: .title, fontWeight: .bold))
                    
                    Spacer()
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 45,height: 25)
                            .foregroundColor(.verde)
                            .cornerRadius(7)
                        
                        Text("XP")
                            .font(.sfMono(fontStyle: .headline, fontWeight: .bold))
                            .foregroundColor(.checkMark)
                    }
                    .padding(.horizontal,5)
                }
                XpBarComponente(userModel: userModel)
                // exibição dos atributos e dos seus respectiveis niveis
                HStack (spacing: 10){
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Destreza")
                        Text("Inteligencia")
                        Text("Resistencia")
                        Text("Vitalidade")
                    }
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(Int(user?.destreza ?? -1))")
                        Text("\(Int(user?.inteligencia ?? -1))")
                        Text("\(Int(user?.resistencia ?? -1))")
                        Text("\(Int(user?.vitalidade ?? -1))")
                    }
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Sintonia")
                        Text("Vigor")
                        Text("Fé")
                        Text("Força")
                        
                    }
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(Int(user?.sintonia ?? -1))")
                        Text("\(Int(user?.vigor ?? -1))")
                        Text("\(Int(user?.fe ?? -1))")
                        Text("\(Int(user?.forca ?? -1))")
                    }
                }
                .font(.sfMono())
                .foregroundColor(.accentColor)
            }
            .onAppear{
                user = userModel.users[0]
            }
        
        }
    }


//#Preview {
//    NivelComponent(user:   )
//}
