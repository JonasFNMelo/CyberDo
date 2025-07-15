//
//  HomeView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//
import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .font(.sfMono(fontStyle: .title ,fontWeight: .bold))
                        .bold()
        }
        
        .onAppear{
            debugfont()
        }
    }
}

#Preview {
    HomeView()
}

func debugfont(){
    for NameFont in UIFont.familyNames{
        print(NameFont)
        for CharFont in UIFont.fontNames(forFamilyName: NameFont) {
            print("---- \(CharFont)")
        }
    }
}
