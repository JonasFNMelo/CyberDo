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
    @ObservedObject var userModel = UserModel()
    @ObservedObject var metaModel = MetasModel()
    
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
            userModel.createUser()
            metaModel.getMeta()
//            deleteAll()
        }
        
    }
    
    func deleteAll() {
        for todo in toDoModel.toDos{
            toDoModel.deleteToDo(todo)
        }
        for meta in metaModel.metas{
            metaModel.deleteMeta(meta)
        }
    }
}

#Preview {
    ContentView()
}
