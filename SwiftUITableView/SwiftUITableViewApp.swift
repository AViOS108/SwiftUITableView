//
//  SwiftUITableViewApp.swift
//  SwiftUITableView
//
//  Created by Anurag Bhakuni on 05/08/21.
//

import SwiftUI

@main
struct SwiftUITableViewApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
