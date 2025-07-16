//
//  QuestComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

struct QuestComponent: View {
    
    @State var isComplete = false
    var colorComponent: Color
    
    @State private var bio = ""

    var body: some View {
        
        VStack{
            Rectangle()
                .frame(width: 345, height: 60)
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
                                    .font(.sfMono(fontWeight: .bold))
                                Text("Categoria 1")
                                    .font(.sfMono(fontStyle: .caption,fontWeight: .semibold))
                            }
                            
                            Spacer()
                            
                            Button {
                                isComplete.toggle()
                            } label: {
                                if isComplete == false{
                                    Rectangle()
                                        .frame(width: 40, height: 40)
                                        .opacity(0)
                                        .border(colorComponent)
                                } else {
                                    ZStack{
                                        Rectangle()
                                            .frame(width: 40, height: 40)
                                            .border(colorComponent)
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.checkMark)
                                            .bold()
                                            .font(.title2)
                                    }
                                }
                            }

                            
                        }
                        .padding(17)
                        
                        
                        
                    }
                }
            
            Rectangle()
                .frame(width: 345, height: 100)
                .opacity(0)
                .border(colorComponent)
                .overlay{
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget molestie nunc. Etiam vel fringilla orci.")
                        .padding()
                
                }
                .padding(.top, -9)
        }
        .foregroundColor(colorComponent)
    }
}

#Preview {
    QuestComponent(colorComponent: .verde)
}
