//
//  PikerComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 16/07/25.
//

import SwiftUI

/// Piker para filtrar conquistas
struct PikerConquistaComponent: View {
    @State var num: Int = 0
    var body: some View {
        HStack{
            
            Spacer()
            
            Button {
                num = 0
            } label: {
                if num%4 == 0 {
                    Text("Conquistas")
                        .font(.sfMono(fontWeight: .bold))
                        .foregroundColor(.accent)
                        .padding(.leading, -25)

                }
                if num%4 != 0 {
                    Text("Conquistas")
                        .font(.sfMono(fontWeight: .semibold))
                        .foregroundColor(.gray)
                        .padding(.leading, -25)

                }
            }
            Spacer()

            Text("|")
                .bold()
                .padding(.leading, -15)

            
            Spacer()


            Button {
                num = 1
            } label: {
                if num%4 == 1 {
                    Text("Done")
                        .font(.sfMono(fontWeight: .bold))
                        .foregroundColor(.accent)
                }
                if num%4 != 1 {
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
    PikerConquistaComponent()
}
