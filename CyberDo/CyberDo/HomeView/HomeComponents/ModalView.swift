//
//  ModalView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 18/07/25.
//

import SwiftUI

struct ModalView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var toDoModel = ContentViewModel()

    @State private var nomeQ: String = ""
    @State private var frequencia: String = ""
    @State private var descricao: String = ""
    @State private var categoria: String = ""



    var body: some View {
        VStack(alignment: .leading,spacing: 20){
            
            Text("Nova Quest")
                .font(.sfMono(fontStyle: .largeTitle,fontWeight: .bold))
            
            Text("Digite o nome da Quest:")
                .font(.sfMono(fontStyle: .title3,fontWeight: .bold))

            TextField("Digite aqui", text: $nomeQ)
            
            Text("Digite o Descrição da Quest:")
                .font(.sfMono(fontStyle: .title3,fontWeight: .bold))

            TextField("Digite aqui", text: $descricao)
            
            Text("Escolha a frequencia da Quest")
                .font(.sfMono(fontStyle: .title3,fontWeight: .bold))

            
            HStack{
                
                Spacer()
                
                Button {
                    frequencia = "diariamente"
                } label: {
                    if frequencia != "diariamente"{
                        ZStack{
                            Rectangle()
                                .frame(width: 120,height: 40)
                                .cornerRadius(15)
                            Text("Diariamente")
                                .foregroundStyle(.checkMark)
                        }
                    }
                    else{
                        ZStack{
                            Rectangle()
                                .frame(width: 120,height: 40)
                                .cornerRadius(15)
                            Text("Diariamente")
                                .foregroundStyle(.checkMark)
                        }
                        .opacity(0.70)
                    }
                }
                
                Spacer()

                Button {
                    frequencia = "semanalmente"
                } label: {
                    if frequencia != "semanalmente"{
                        ZStack{
                            Rectangle()
                                .frame(width: 130,height: 40)
                                .cornerRadius(15)
                            Text("Semanalmente")
                                .foregroundStyle(.checkMark)
                        }
                    }
                    else{
                        ZStack{
                            Rectangle()
                                .frame(width: 130,height: 40)
                                .cornerRadius(15)
                            Text("Semanalmente")
                                .foregroundStyle(.checkMark)
                        }
                        .opacity(0.70)
                    }
                }
                
                
                Spacer()

                Button {
                    frequencia = "mensalmente"
                } label: {
                    if frequencia != "mensalmente"{
                        ZStack{
                            Rectangle()
                                .frame(width: 120,height: 40)
                                .cornerRadius(15)
                            Text("Mensalmente")
                                .foregroundStyle(.checkMark)
                        }
                    }
                    else{
                        ZStack{
                            Rectangle()
                                .frame(width: 120,height: 40)
                                .cornerRadius(15)
                            Text("Mensalmente")
                                .foregroundStyle(.checkMark)
                        }
                        .opacity(0.70)
                    }
                }
                
                Spacer()

            }
            
            Text("Escolha a categoria da Quest")
                .font(.sfMono(fontStyle: .title3,fontWeight: .bold))


            HStack{
                
                Spacer()
                
                Button {
                    categoria = "destresa"
                } label: {
                    if categoria != "destresa"{
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.majenta)
                            Text("Destresa")
                                .foregroundStyle(.checkMark)
                        }
                    }
                    else{
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.majenta)
                            Text("Destresa")
                                .foregroundStyle(.checkMark)
                        }
                        .opacity(0.7)
                    }
                }
                
                Spacer()

                Button {
                    categoria = "fe"
                } label: {
                    if categoria != "fe"{
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.amarelo)
                            
                            Text("Fé")
                                .foregroundStyle(.checkMark)
                        }
                    }
                    else{
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.amarelo)
                            
                            Text("Fé")
                                .foregroundStyle(.checkMark)
                        }
                        .opacity(0.7)
                    }
                    
                }
                Spacer()

                Button {
                    categoria = "resistencia"
                } label: {
                    if categoria != "resistencia"{
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.vermelho)
                            
                            Text("Resistecia")
                                .foregroundStyle(.checkMark)
                        }
                    }
                    else{
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.vermelho)
                            
                            Text("Resistecia")
                                .foregroundStyle(.checkMark)
                        }
                        .opacity(0.7)
                    }
                }
                Spacer()

            }
            
            HStack{
                
                Spacer()
                
                Button {
                    categoria = "vitalidade"
                } label: {
                    if categoria != "vitalidade"{
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.verde)
                            
                            Text("Vitalidade")
                                .foregroundStyle(.checkMark)
                        }
                        
                    }
                    else{
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.verde)
                            
                            Text("Vitalidade")
                                .foregroundStyle(.checkMark)
                        }
                        .opacity(0.7)
                    }
                }
                
                Spacer()

                Button {
                    categoria = "sintonia"
                } label: {
                    if categoria  != "sintonia"{
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.majenta)
                            
                            Text("Sintonia")
                                .foregroundStyle(.checkMark)
                        }
                    }
                    else{
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.majenta)
                            
                            Text("Sintonia")
                                .foregroundStyle(.checkMark)
                        }
                        .opacity(0.7)
                    }
                }
                
                Spacer()

                Button {
                    categoria = "vigor"
                } label: {
                    if categoria != "vigor"{
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.verde)
                            
                            Text("Vigor")
                                .foregroundStyle(.checkMark)
                        }
                    }
                    else{
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.verde)
                            
                            Text("Vigor")
                                .foregroundStyle(.checkMark)
                        }
                        .opacity(0.7)
                    }
                }
                Spacer()

            }
            HStack{
                
                Spacer()
                
                Button {
                    categoria = "inteligencia"
                } label: {
                    if categoria != "inteligencia"{
                        ZStack{
                            Rectangle()
                                .frame(width: 130,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.azul)
                            
                            Text("Inteligencia")
                                .foregroundStyle(.checkMark)
                        }
                    }
                    else{
                        ZStack{
                            Rectangle()
                                .frame(width: 130,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.azul)
                            
                            Text("Inteligencia")
                                .foregroundStyle(.checkMark)
                        }
                        .opacity(0.7)
                    }
                }
                
                Spacer()

                Button {
                    categoria = "forca"
                } label: {
                    if categoria != "forca" {
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.vermelho)
                            
                            Text("Força")
                                .foregroundStyle(.checkMark)
                        }
                    }
                    else{
                        ZStack{
                            Rectangle()
                                .frame(width: 110,height: 40)
                                .cornerRadius(15)
                                .foregroundStyle(.vermelho)
                            
                            Text("Força")
                                .foregroundStyle(.checkMark)
                        }
                        .opacity(0.7)
                    }
                }
                Spacer()

            }
            
            Button {
                toDoModel.createToDo(nome: nomeQ, descricao: descricao, categoria: categoria, frequencia: frequencia)
                presentation.wrappedValue.dismiss()
            } label: {
                Text("Salvar")
            }
        }
        .font(.sfMono())
    }
}

#Preview {
    ModalView()
}
