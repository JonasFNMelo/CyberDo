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
            HomeView(toDoModel: toDoModel, metaModel: metaModel, userModel: userModel, )
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            AchivementView()
                .tabItem {
                    Label("Achievements", systemImage: "medal")
                }
            
            ProfileView(todoModel: toDoModel, metaModel: metaModel, userModel: userModel)
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .onAppear{
            toDoModel.getToDo()
            userModel.createUser()
            metaModel.getMeta()
            userModel.getUser()
                        deleteAll()
            
            
        }
        
    }
    
    func deleteAll() {
        for todo in toDoModel.toDos{
            toDoModel.deleteToDo(todo)
        }
        for meta in metaModel.metas{
            metaModel.deleteMeta(meta)
        }
        for user in userModel.users {
            userModel.deleteUser(user)
        }
    }
}

#Preview {
    ContentView()
}
