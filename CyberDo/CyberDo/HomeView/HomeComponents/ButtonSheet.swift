//
//  ButtonSheet.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 21/07/25.
//

import SwiftUI

struct ButtonSheet: View {
    
    @Binding var valor: String
    var tamanho: CGFloat
    var texto:String
    var colorComponent: Color
    
    var body: some View {
        Button {
            valor = texto
        } label: {
            if valor != texto{
                ZStack{
                    Rectangle()
                        .frame(width: tamanho,height: 40)
                        .cornerRadius(15)
                        .foregroundColor(colorComponent)
                    Text(texto)
                        .foregroundStyle(.checkMark)
                }
            }
            else{
                
                ZStack{
                    Rectangle()
                        .frame(width: tamanho,height: 40)
                        .cornerRadius(15)
                        .foregroundColor(colorComponent)
                    
                    Rectangle()
                        .frame(width: tamanho - 5,height: 35)
                        .cornerRadius(13)
                        .foregroundColor(.checkMark)
                    Text(texto)
                        .foregroundStyle(colorComponent)
                }

            }
        }
    }
}

#Preview {
    @Previewable @State var frequencia: String = ""
    ButtonSheet(valor: $frequencia, tamanho: 120, texto: "diariamente", colorComponent: .accent)
}
