//
//  HomeView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//
import Foundation
import SwiftUI

/// Arquivo principal que junta todos os componentes da tela home
struct HomeView: View {
    var body: some View {
        
        ScrollView{
            
            VStack(spacing: 20){
                
                CabecalhoHomeComponent()
                
                CalendarioComponent()
                
                PikerComponent()
                
                QuestComponent(colorComponent: .accent)
                
                QuestComponent(colorComponent: .verde)
                
                QuestComponent(colorComponent: .azul)
                
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
