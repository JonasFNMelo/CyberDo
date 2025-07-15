//
//  ProfileView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        ScrollView{
            
            VStack(spacing: 50){
                
                Spacer()
                OfencivaComponent(currentXP: 5, maxXP: 10)
                
                NivelComponent()
                
                MetasComponent()
                
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    ProfileView()
    
}
