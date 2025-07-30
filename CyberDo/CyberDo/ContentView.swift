//
//  ContentView.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//

import SwiftUI

/// ContentView é a "Main" do codigo, atraves dela é possivel acessar todas as telas e navegar com a tab bar
struct ContentView: View {
    
    init(){
        LocalNotifications.AddNotification(title: "Suas Quests estão com sdds de vc", subtitle: "as metas nem tanto", body: "elas não vao ser feitas sozinhas 🤨", hour: 10, minute: 35, interval: 259200)
    }
    
    @State var isCompleteArray: [Bool] = []
    let url: String =  "https://gist.githubusercontent.com/JonasFNMelo/d5d45337b25510e81ef94893b1f49c17/raw/ab9b3743f381b1c8d3d9796d57a6c5254ca8a45f/Conquista.json"
        
    @ObservedObject var jsonData = DataWeb()
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
            AchivementView(jsonData: jsonData, isCompleteArray: $isCompleteArray)
                .tabItem {
                    Label("Achievements", systemImage: "medal")
                }
            
            ProfileView(todoModel: toDoModel, metaModel: metaModel, userModel: userModel, jsonData: jsonData, isCompleteArray: $isCompleteArray)
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .onChange(of: userModel.users.first){
            toDoModel.getToDo()
            isCompleteToggle(userModel: userModel, conquistas: jsonData.conquistas)
        }
        .onAppear{
            Task{
                await jsonData.getData(url: url)
                
                userModel.getUser()
                isCompleteToggle(userModel: userModel, conquistas: jsonData.conquistas)
            }
            toDoModel.getToDo()
            userModel.createUser()
            metaModel.getMeta()
            userModel.getUser()
            toDoModel.toggleDoneAfterADay()
        }
        .onDisappear{
            userModel.getUser()
            isCompleteToggle(userModel: userModel, conquistas: jsonData.conquistas)
        }
        
    }
    
    func deleteAll() {
        for todo in toDoModel.toDos{
            toDoModel.deleteToDo(todo)
        }
        for meta in metaModel.metas{
            meta.isCounted = true
            metaModel.deleteMeta(meta)
        }
        for user in userModel.users {
            userModel.deleteUser(user)
        }
        LocalNotifications.removeNotification()
        
    }
    
    func isCompleteToggle(userModel: UserModel, conquistas: [Conquista]){
        isCompleteArray.removeAll()
        userModel.getUser()
        
        let user = userModel.users.first
        
        for  conquista in conquistas{
            switch conquista.categoria {
            case "Destreza":
                //            if conquista.numMax <= Int(user.destreza){
                if conquista.numMax <= Int(user?.destreza ?? -1){
                    isCompleteArray.append(true)
                }else{
                    isCompleteArray.append(false)
                }
            case "Inteligência":
                //            if conquista.numMax <= Int(user.inteligencia){
                if conquista.numMax <= Int(user?.inteligencia ?? -1){
                    isCompleteArray.append(true)

                }else{
                    isCompleteArray.append(false)
                }
            case "Resistencia":
                //            if conquista.numMax <= Int(user.resistencia){
                if conquista.numMax <= Int(user?.resistencia ?? -1){
                    isCompleteArray.append(true)

                }else{
                    isCompleteArray.append(false)
                }
            case "Vitalidade":
                //            if conquista.numMax <= Int(user.vitalidade){
                if conquista.numMax <= Int(user?.vitalidade ?? -1){
                    isCompleteArray.append(true)

                }else{
                    isCompleteArray.append(false)
                }
            case "Sintonia":
                //            if conquista.numMax <= Int(user.sintonia){
                if conquista.numMax <= Int(user?.sintonia ?? -1){
                    isCompleteArray.append(true)
                    
                }else{
                    isCompleteArray.append(false)
                }
            case "Vigor":
                //            if conquista.numMax <= Int(user.vigor){
                if conquista.numMax <= Int(user?.vigor ?? -1){
                    isCompleteArray.append(true)

                }else{
                    isCompleteArray.append(false)
                }
            case "Fé":
                //            if conquista.numMax <= Int(user.fe){
                if conquista.numMax <= Int(user?.fe ?? -1){
                    isCompleteArray.append(true)

                }else{
                    isCompleteArray.append(false)
                }
            case "Força":
                //            if conquista.numMax <= Int(user.forca){
                if conquista.numMax <= Int(user?.forca ?? -1){
                    isCompleteArray.append(true)

                }else{
                    isCompleteArray.append(false)
                }
                
            default:
                isCompleteArray.append(false)
            }
        }
    }
}

#Preview {
    ContentView()
}
