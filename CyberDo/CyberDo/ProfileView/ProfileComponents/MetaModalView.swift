//
//  MetaModalView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 22/07/25.
//

import SwiftUI

struct MetaModalView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var metaModel: MetasModel

    //Variaveis para serem ultilizadas na criação da quest
    @State private var titulo: String = ""
    @State private var categoria: String = ""
    @State private var numQuests: Int = 0
    
    var intProxy: Binding<Double>{
        Binding<Double>(get: {
            return Double(numQuests)
        }, set: {
            numQuests = Int($0)
        })
    }
    
    var body: some View {
        
        NavigationStack{
            VStack(alignment: .leading,spacing: 20){
                
                Text("Nova Meta")
                    .font(.sfMono(fontStyle: .largeTitle,fontWeight: .bold))
                
                
                Text("Digite o Título da Meta:")
                    .font(.sfMono(fontStyle: .title3,fontWeight: .bold))
                TextField("Digite aqui", text: $titulo)
                
                
                Text("Escolha quantas Quests devem ser feitas para atingir a meta:")
                
                VStack {
                    Text("\(numQuests)")
                    Slider(value: intProxy, in: 0...10)
                }
                
                
                Text("Escolha a categoria da Meta")
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
            }
            .padding(.leading)
            .font(.sfMono())
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button {
                        metaModel.createMeta(titulo: titulo, maximo: Double(numQuests), categoria: categoria)
                        dismiss()
                        
                    } label: {
                        Text("Salvar")
                    }
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
    @ObservedObject var metaModel = MetasModel()
    MetaModalView(metaModel: metaModel)
}
