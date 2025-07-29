//
//  AchivementView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//

import SwiftUI

/// Tela responsavel por exibir ao usuario suas conquistas bloqueadas e desbloqueadas
struct AchivementView: View {
    
    @ObservedObject var todoModel = HomeViewModel()
    @ObservedObject var userModel = UserModel()
    @ObservedObject var metaModel = MetasModel()
    
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
