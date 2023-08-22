//
//  BrickorderApp.swift
//  Brickorder
//
//  Created by vatran robert on 2023-08-07.
//

import SwiftUI
import FirebaseCore

@main
struct BrickorderApp: App {

    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(DataManager.shared)
        }
    }
}
