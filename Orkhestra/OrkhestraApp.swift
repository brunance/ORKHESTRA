//
//  OrkhestraApp.swift
//  Orkhestra
//
//  Created by Anna Alicia Milani on 22/11/22.
//

import SwiftUI

@main
struct OrkhestraApp: App {
    @StateObject var audioManager = AudioManager()
    var body: some Scene {
        WindowGroup {
            HistoryView()
                .environmentObject(audioManager)
        }
    }
}
