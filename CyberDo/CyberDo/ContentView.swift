//
//  ContentView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var toDoModel = ContentViewModel()
    var body: some View {
 
        TabView {
            HomeView()
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
