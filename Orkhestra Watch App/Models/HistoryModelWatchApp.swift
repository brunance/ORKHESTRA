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
    var lisfOfInstruments: [InstrumentModel]
    
    init(id: Int, name: String, title: String, navTitle: String, lisfOfInstruments: [InstrumentModel]) {
        self.id = id
        self.name = name
        self.title = title
        self.navTitle = navTitle
        self.lisfOfInstruments = lisfOfInstruments
    }
}

let historyList: [HistoryModelWatchApp] = [

    HistoryModelWatchApp(
        id: 0,
        name: "Aranha",
        title: "a dona Aranha",
        navTitle: "a D. Aranha",
        lisfOfInstruments: [
            InstrumentModel(id: 0, name: "Chocalho", image: "Chocalho", challenge: "Gire o Pulso 1"),
            InstrumentModel(id: 1, name: "Flauta", image: "Flauta", challenge: "Gire o Pulso 2"),
            InstrumentModel(id: 2, name: "Pandeiro", image: "Pandeiro", challenge: "Gire o Pulso 3"),
            InstrumentModel(id: 3, name: "Piano", image: "Piano", challenge: "Gire o Pulso 4"),
            InstrumentModel(id: 4, name: "Saxofone", image: "Saxofone", challenge: "Gire o Pulso 5"),
            InstrumentModel(id: 5, name: "Violão", image: "Violao", challenge: "Gire o Pulso 6")
        ]
    ),

    HistoryModelWatchApp(
        id: 1,
        name: "Borboleta",
        title: "a Borboleta",
        navTitle: "a Borboleta",
        lisfOfInstruments: [
            InstrumentModel(id: 0, name: "Chocalho", image: "Chocalho", challenge: "Gire o Pulso 7"),
            InstrumentModel(id: 1, name: "Flauta", image: "Flauta", challenge: "Gire o Pulso 8"),
            InstrumentModel(id: 2, name: "Pandeiro", image: "Pandeiro", challenge: "Gire o Pulso 9"),
            InstrumentModel(id: 3, name: "Piano", image: "Piano", challenge: "Gire o Pulso 10"),
            InstrumentModel(id: 4, name: "Saxofone", image: "Saxofone", challenge: "Gire o Pulso 11"),
            InstrumentModel(id: 5, name: "Violão", image: "Violao", challenge: "Gire o Pulso 12")
        ]
    ),

    HistoryModelWatchApp(
        id: 2,
        name: "Barata",
        title: "a Barata",
        navTitle: "a Barata",
        lisfOfInstruments: [
            InstrumentModel(id: 0, name: "Chocalho", image: "Chocalho", challenge: "Gire o Pulso 13"),
            InstrumentModel(id: 1, name: "Flauta", image: "Flauta", challenge: "Gire o Pulso 14"),
            InstrumentModel(id: 2, name: "Pandeiro", image: "Pandeiro", challenge: "Gire o Pulso 15"),
            InstrumentModel(id: 3, name: "Piano", image: "Piano", challenge: "Gire o Pulso 16"),
            InstrumentModel(id: 4, name: "Saxofone", image: "Saxofone", challenge: "Gire o Pulso 17"),
            InstrumentModel(id: 5, name: "Violão", image: "Violao", challenge: "Gire o Pulso 18")
        ]
    )
]
