//
//  CabecalhoComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 16/07/25.
//

import SwiftUI

/// Cabeçalho, com botao para criar uma nova quest
struct CabecalhoHomeComponent: View {
    
    @Binding var showModal: Bool
    var body: some View {
        HStack{
            
            Text("Quests")
                .font(.sfMono(fontStyle: .largeTitle ,fontWeight: .bold))
                .bold()
            
            Spacer()
            
            Button {
                showModal = true
            } label: {
                Image(systemName: "plus")
                    .bold()
                    .foregroundColor(.accent)
                    .font(.title2)
            }
            
            
        }
        .sheet(isPresented: $showModal){
            ModalView()
        }
        
    }
}

#Preview {
    @Previewable @State var showModal = false
    CabecalhoHomeComponent(showModal: $showModal)
}
