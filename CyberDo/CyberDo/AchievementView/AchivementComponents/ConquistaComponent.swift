//
//  QuestComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 15/07/25.
//

import SwiftUI

struct ConquistaComponent: View {
    
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
                    
                            Image(systemName: "trophy.fill")
                                .font(.title)
                            
                            VStack (alignment: .leading){
                                Text("Nome da Conquista")
                                    .font(.sfMono(fontWeight: .bold))
                                Text("Categoria 1")
                                    .font(.sfMono(fontStyle: .caption,fontWeight: .semibold))
                            }
                            
                            Spacer()
                            
                            Button {
                                isComplete.toggle()
                            } label: {
                                if isComplete == false{
                                    Image(systemName: "lock")
                                        .foregroundColor(colorComponent)
                                        .font(.title)
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
    ConquistaComponent(colorComponent: .verde)
}
