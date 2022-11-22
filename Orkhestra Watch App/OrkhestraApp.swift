//
//  OrkhestraApp.swift
//  Orkhestra Watch App
//
//  Created by Anna Alicia Milani on 22/11/22.
//

import SwiftUI

@main
struct OrkhestraWatchApp: App {
    @StateObject var audioManager = AudioManagerWatch()
    var body: some Scene {
        WindowGroup {
            MenuViewWatchApp()
                .environmentObject(audioManager)
        }
    }
}
