//
//  CabecalhoComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 16/07/25.
//

import SwiftUI

struct CabecalhoHomeComponent: View {
    var body: some View {
        HStack{
            
            Text("Quests")
                .font(.sfMono(fontStyle: .largeTitle ,fontWeight: .bold))
                .bold()
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "plus")
                    .bold()
                    .foregroundColor(.accent)
                    .font(.title2)
            }
            
            
        }
        
    }
}

#Preview {
    CabecalhoHomeComponent()
}
