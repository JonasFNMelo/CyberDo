//
//  ContentView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//

import SwiftUI

/// ContentView é a "Main" do codigo, atraves dela é possivel acessar todas as telas e navegar com a tab bar
struct ContentView: View {
    
    @ObservedObject var toDoModel = HomeViewModel()
    
    var body: some View {
 //Tab Bar
        TabView {
            HomeView(toDoModel: toDoModel)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            AchivementView()
                .tabItem {
                    Label("Achievements", systemImage: "medal")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .onAppear{
            toDoModel.getToDo()
        }
        
    }
}

#Preview {
    ContentView()
}
