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
                
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
                
                
            } label: {
                Image(systemName: "bell")
                    .bold()
                    .foregroundColor(.accent)
                    .font(.title2)
            }
            .padding(.horizontal,10)
            
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
