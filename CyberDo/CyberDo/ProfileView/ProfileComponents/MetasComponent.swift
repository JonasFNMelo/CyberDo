//
//  MetasComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

/// Componente onde o usuario pode acompanhar e criar novas metas
struct MetasComponent: View {
    
    @State var showModal: Bool = false
    @ObservedObject var metaModel = MetasModel()

    var body: some View {
        VStack (alignment: .leading, spacing: 10){

            HStack{
                //Titulo do component
                Text("Metas")
                    .font(.sfMono(fontStyle: .title, fontWeight: .bold))
                
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
            
            ForEach(metaModel.metas, id: \.self) { meta in
                GraficoProgressoComponent(currentXP: meta.atual, titulo: meta.titulo!, maxXP: meta.maximo, categoria: meta.categoria!)
            }
        }
        .onAppear{
            metaModel.getMeta()
        }
        .sheet(isPresented: $showModal){
            MetaModalView()
        }
    }
}

#Preview {
    MetasComponent()
}
