//
//  MyBillsApp.swift
//  Shared
//
//  Created by Carlos Henrique Pereira do Carmo on 20/08/22.
//

import SwiftUI

@main
struct MyBillsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
