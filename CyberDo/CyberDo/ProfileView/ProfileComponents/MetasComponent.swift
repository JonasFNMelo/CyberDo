//
//  MetasComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

/// Componente onde o usuario pode acompanhar e criar novas metas
struct MetasComponent: View {
    
    @Binding var showModal: Bool
    @ObservedObject var metaModel: MetasModel
    @ObservedObject var userModel: UserModel
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
                GraficoProgressoComponent(meta: meta)
                    .onAppear{
                        metaModel.metaProgress(meta: meta)
                    }
            }
            
        }
        .onAppear{
            metaModel.getMeta()
        }
        .sheet(isPresented: $showModal){
            MetaModalView(metaModel: metaModel)
        }
    }
}

//#Preview {
//    MetasComponent()
//}
