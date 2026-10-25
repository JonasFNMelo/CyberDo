//
//  NoQuestText.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 29/07/25.
//

import SwiftUI

struct NoQuestText: View {
    
    @Binding var filtro: String
    @Binding var toDos: [ToDo]
    @Binding var showModal: Bool
    var body: some View {
        if toDos == [] && filtro != "Done"{
            Button {
                showModal = true
            } label: {
                Text("Parece que você não tem quests para fazer, perte aqui para adcionar uma Quest")
                    .bold()
                    .foregroundColor(.accent)
                    .opacity(0.6)
                    .font(.headline)
            }
            .padding(.top,200)
        }else if toDos == [] && filtro == "Done"{
            Text("Não há Quests feitas")
                .bold()
                .foregroundColor(.accent)
                .opacity(0.6)
                .font(.headline)
        }
    }
}

#Preview {
    @Previewable @State var filtro: String = "Main"
    @Previewable @State var toDos: [ToDo] = []
    @Previewable @State var showModal: Bool = false
    NoQuestText(filtro: $filtro, toDos: $toDos, showModal: $showModal)
}
