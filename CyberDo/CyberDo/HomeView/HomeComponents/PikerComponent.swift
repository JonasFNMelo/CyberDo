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
        
        Grid(horizontalSpacing: 40){
            GridRow{
                //botão Main
                Button {
                    num = 0
                } label: {
                    if num%4 == 0 {
                        Text("Main")
                            .foregroundColor(.accent)
                    }
                    if num%4 != 0 {
                        Text("Main")
                            .foregroundColor(.gray)
                    }
                }
                
                Text("|")
                
                //botão Side
                Button {
                    num = 1
                } label: {
                    if num%4 == 1 {
                        Text("Side")
                            .foregroundColor(.accent)
                    }
                    if num%4 != 1 {
                        Text("Side")
                            .foregroundColor(.gray)
                    }
                }
                
                Text("|")
                
                //botão Done
                Button {
                    num = 3
                } label: {
                    if num%4 == 3 {
                        Text("Done")
                            .foregroundColor(.accent)
                    }
                    if num%4 != 3 {
                        Text("Done")
                            .foregroundColor(.gray)
                    }
                }
            }
            .font(.sfMono(fontStyle: .headline,fontWeight: .bold))

        }
        .padding(10)
    }
}

#Preview {
    PikerComponent()
}
