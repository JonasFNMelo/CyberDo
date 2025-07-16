//
//  PikerComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 16/07/25.
//

import SwiftUI

struct PikerComponent: View {
    @State var num: Int = 0
    var body: some View {
        HStack{
            
            Spacer()
            
            Button {
                num = 0
            } label: {
                if num%4 == 0 {
                    Text("Main")
                        .font(.sfMono(fontWeight: .bold))
                        .foregroundColor(.accent)
                }
                if num%4 != 0 {
                    Text("Main")
                        .font(.sfMono(fontWeight: .semibold))
                        .foregroundColor(.gray)
                }
            }
            Spacer()

            Text("|")
            
            Spacer()


            Button {
                num = 1
            } label: {
                if num%4 == 1 {
                    Text("Side")
                        .font(.sfMono(fontWeight: .bold))
                        .foregroundColor(.accent)
                }
                if num%4 != 1 {
                    Text("Side")
                        .font(.sfMono(fontWeight: .semibold))
                        .foregroundColor(.gray)
                }
            }
            Spacer()

            Text("|")
            
            Spacer()

            Button {
                num = 2
            } label: {
                if num%4 == 2 {
                    Text("Events")
                        .font(.sfMono(fontWeight: .bold))
                        .foregroundColor(.accent)
                }
                if num%4 != 2 {
                    Text("Events")
                        .font(.sfMono(fontWeight: .semibold))
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()

            Text("|")
            
            Spacer()

            Button {
                num = 3
            } label: {
                if num%4 == 3 {
                    Text("Done")
                        .font(.sfMono(fontWeight: .bold))
                        .foregroundColor(.accent)
                }
                if num%4 != 3 {
                    Text("Done")
                        .font(.sfMono(fontWeight: .semibold))
                        .foregroundColor(.gray)
                }
            }
            Spacer()


        }
        .padding(10)
    }
}

#Preview {
    PikerComponent()
}
