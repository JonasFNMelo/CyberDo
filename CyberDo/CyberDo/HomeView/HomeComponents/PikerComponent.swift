//
//  PikerComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 16/07/25.
//

import SwiftUI

/// Componente responsavel por filtrar as quests que aparecem na tela com base em algumas categorias
struct PikerComponent: View {
    @State var num: Int = 0
    var body: some View {
        HStack{
            
            Spacer()
            
            //botão Main
            Button {
                num = 0
            } label: {
                if num%4 == 0 {
                    Text("Main")
                        .font(.sfMono(fontWeight: .bold))
                        .foregroundColor(.accent)
                }
                if num%4 != 0 {
                    Text("Main")
                        .font(.sfMono(fontWeight: .semibold))
                        .foregroundColor(.gray)
                }
            }
            Spacer()

            Text("|")
            
            Spacer()

            //botão Side
            Button {
                num = 1
            } label: {
                if num%4 == 1 {
                    Text("Side")
                        .font(.sfMono(fontWeight: .bold))
                        .foregroundColor(.accent)
                }
                if num%4 != 1 {
                    Text("Side")
                        .font(.sfMono(fontWeight: .semibold))
                        .foregroundColor(.gray)
                }
            }
            Spacer()

            Text("|")
            
            Spacer()

            //botão Events
            Button {
                num = 2
            } label: {
                if num%4 == 2 {
                    Text("Events")
                        .font(.sfMono(fontWeight: .bold))
                        .foregroundColor(.accent)
                }
                if num%4 != 2 {
                    Text("Events")
                        .font(.sfMono(fontWeight: .semibold))
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()

            Text("|")
            
            Spacer()

            //botão Done
            Button {
                num = 3
            } label: {
                if num%4 == 3 {
                    Text("Done")
                        .font(.sfMono(fontWeight: .bold))
                        .foregroundColor(.accent)
                }
                if num%4 != 3 {
                    Text("Done")
                        .font(.sfMono(fontWeight: .semibold))
                        .foregroundColor(.gray)
                }
            }
            Spacer()


        }
        .padding(10)
    }
}

#Preview {
    PikerComponent()
}
