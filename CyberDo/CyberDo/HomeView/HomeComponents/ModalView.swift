//
//  ModalView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 18/07/25.
//

import SwiftUI

/// Sheet View responsavel por criar uma nova Quest
struct ModalView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var toDoModel = HomeViewModel()
    
    
    //Variaveis para serem ultilizadas na criação da quest
    @State private var nomeQ: String = ""
    @State private var descricao: String = ""
    @State private var categoria: String = ""
    @State private var prioridade: String = ""
    
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 20){
                
//                Text(categoria)
//                Text(frequencia)
//                Text(nomeQ)
//                Text(descricao)

                Text("Nova Quest")
                    .font(.sfMono(fontStyle: .largeTitle,fontWeight: .bold))
                
                Text("Digite o nome da Quest:")
                    .font(.sfMono(fontStyle: .title3,fontWeight: .bold))
                
                TextField("Digite aqui", text: $nomeQ)
                
                Text("Digite o Descrição da Quest:")
                    .font(.sfMono(fontStyle: .title3,fontWeight: .bold))
                
                TextField("Digite aqui", text: $descricao)
                
                
                Text("Escolha a categoria da Quest")
                    .font(.sfMono(fontStyle: .title3,fontWeight: .bold))
                
                
                Grid{
                    
                 
                    GridRow{
                        ButtonSheet(valor: $categoria, tamanho: 110, texto: "Destreza", colorComponent: .majenta)

                        ButtonSheet(valor: $categoria, tamanho: 110, texto: "Fé", colorComponent: .amarelo)

                        ButtonSheet(valor: $categoria, tamanho: 120, texto: "Resistencia", colorComponent: .vermelho)

                    }
                    
                    GridRow{
                        ButtonSheet(valor: $categoria, tamanho: 110, texto: "Vitalidade", colorComponent: .verde)

                        ButtonSheet(valor: $categoria, tamanho: 110, texto: "Sintonia", colorComponent: .majenta)
                        
                        ButtonSheet(valor: $categoria, tamanho: 110, texto: "Vigor", colorComponent: .verde)
                    }
                    
                    GridRow{
                        ButtonSheet(valor: $categoria, tamanho: 130, texto: "Inteligência", colorComponent: .azul)

                        ButtonSheet(valor: $categoria, tamanho: 110, texto: "Força", colorComponent: .vermelho)
                        
                    }
                }
                
                Text("Escolha a prioridade da Quest")
                    .font(.sfMono(fontStyle: .title3,fontWeight: .bold))
                
                Grid{
                    GridRow{
                        ButtonSheet(valor: $prioridade, tamanho: 120, texto: "Main", colorComponent: .vermelho)
                        
                        ButtonSheet(valor: $prioridade, tamanho: 120, texto: "Side", colorComponent: .amarelo)
                    }
                }
            }
            .padding(.leading)
            .font(.sfMono())
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button {
                        toDoModel.createToDo(nome: nomeQ, descricao: descricao, categoria: categoria, prioridade: prioridade)
                        toDoModel.getToDo()
                        dismiss()
                        
                    } label: {
                        Text("Salvar")
                    }
                    .disabled(prioridade == "")
                    .disabled(categoria == "")
                }
                
                ToolbarItem(placement: .cancellationAction){
                    Button{
                        dismiss()
                    } label: {
                        Text("Cancelar")
                    }
                }
            }
        }
    }
}

#Preview {
    ModalView()
}
