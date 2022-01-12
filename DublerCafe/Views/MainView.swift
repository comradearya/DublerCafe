//
//  MainView.swift
//  
//
//  Created by arina.panchenko on 15.12.2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView{
            ContentView()
                .tabItem{
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem{
                    Label("Order", systemImage: "square.and.pencil")
                }
            ChatView()
                .tabItem{
                    Label("Chat", systemImage: "contact")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Order())
    }
}
