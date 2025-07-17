//
//  AchivementView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//

import SwiftUI

struct AchivementView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                CabecalhoConquistaComponent()
                
                VStack(spacing: 20){
                    
                    PikerConquistaComponent()
                    
                    ConquistaComponent(colorComponent: .verde)
                    
                    ConquistaComponent(colorComponent: .majenta)
                    
                    ConquistaComponent(colorComponent: .azul)
                    
                    ConquistaComponent(colorComponent: .vermelho)
                    
                    
                }
            }
        }
    }
}

#Preview {
    AchivementView()
}
