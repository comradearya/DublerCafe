//
//  DublerCafe.swift
//
//
//  Created by arina.panchenko on 08.12.2021.
//

import SwiftUI

@main
struct DublerCafeApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var order = Order()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
