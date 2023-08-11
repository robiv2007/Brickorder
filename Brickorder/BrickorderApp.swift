//
//  BrickorderApp.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-07.
//

import SwiftUI
import Firebase

@main
struct BrickorderApp: App {

    @StateObject var dataManager = DataManager()

    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(dataManager)
        }
    }
}
