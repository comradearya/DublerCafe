//
//  ContentView.swift
//  
//
//  Created by arina.panchenko on 08.12.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View{
        NavigationView{
            List {
                ForEach(menu){ section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) {
                            item in
                            NavigationLink(destination: ItemDetail(item: item)){
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
