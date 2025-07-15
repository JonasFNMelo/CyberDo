//
//  QuestComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

struct QuestComponent: View {
    
    var colorComponent: Color
    
    var body: some View {
        
        Rectangle()
            .frame(width: 345, height: 130)
            .opacity(0)
            .border(colorComponent)
            .overlay{
                VStack{
                    HStack {
                        
                        Rectangle()
                            .frame(width: 40, height: 40)
                            .opacity(0)
                            .border(colorComponent)
                        
                        VStack (alignment: .leading){
                            Text("Nome da Tarefa")
                            
                            Text("Categoria 1")
                        }
                        
                        Spacer()
                        
                        Rectangle()
                            .frame(width: 40, height: 40)
                            .opacity(0)
                            .border(colorComponent)
                    }
                    .padding(17)
                    
                    Rectangle()
                        .frame(width: 345, height: 1)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tempus metus in iaculis ")
                    
                    Spacer()
                }
            }
        
        
        
    }
}

#Preview {
    QuestComponent(colorComponent: .accent)
}
