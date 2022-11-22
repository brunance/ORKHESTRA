//
//  HistoryModelWatchApp.swift
//  orkhestraWatch Watch App
//
//  Created by Anna Alicia Milani on 18/11/22.
//

import Foundation
import SwiftUI

struct HistoryModelWatchApp: Identifiable, Hashable {
    var id: Int
    var name: String
    var title: String
    var navTitle: String

    init(id: Int, name: String, title: String, navTitle: String) {
        self.id = id
        self.name = name
        self.title = title
        self.navTitle = navTitle
    }
}

let historyList: [HistoryModelWatchApp] = [

    HistoryModelWatchApp(id: 0, name: "Aranha", title: "a dona Aranha", navTitle: "a D. Aranha"),

    HistoryModelWatchApp(id: 1, name: "Borboleta", title: "a Borboleta", navTitle: "a Borboleta"),

    HistoryModelWatchApp(id: 2, name: "Barata", title: "a Barata", navTitle: "a Barata")
]
