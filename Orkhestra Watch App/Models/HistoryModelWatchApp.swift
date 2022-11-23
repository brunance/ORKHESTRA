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
            InstrumentModel(id: 0, name: "Chocalho", image: "Chocalho", challenge: "Gire o Pulso"),
            InstrumentModel(id: 1, name: "Flauta", image: "Flauta", challenge: "Gire o Pulso"),
            InstrumentModel(id: 2, name: "Pandeiro", image: "Pandeiro", challenge: "Gire o Pulso"),
            InstrumentModel(id: 3, name: "Piano", image: "Piano", challenge: "Gire o Pulso"),
            InstrumentModel(id: 4, name: "Saxofone", image: "Saxofone", challenge: "Gire o Pulso"),
            InstrumentModel(id: 5, name: "Violão", image: "Violao", challenge: "Gire o Pulso")
        ]
    ),

    HistoryModelWatchApp(
        id: 1,
        name: "Borboleta",
        title: "a Borboleta",
        navTitle: "a Borboleta",
        lisfOfInstruments: [
            InstrumentModel(id: 0, name: "Chocalho", image: "Chocalho", challenge: "Leve a mão ao peito"),
            InstrumentModel(id: 1, name: "Flauta", image: "Flauta", challenge: "Leve a mão ao peito"),
            InstrumentModel(id: 2, name: "Pandeiro", image: "Pandeiro", challenge: "Leve a mão ao peito"),
            InstrumentModel(id: 3, name: "Piano", image: "Piano", challenge: "Leve a mão ao peito"),
            InstrumentModel(id: 4, name: "Saxofone", image: "Saxofone", challenge: "Leve a mão ao peito"),
            InstrumentModel(id: 5, name: "Violão", image: "Violao", challenge: "Leve a mão ao peito")
        ]
    ),

    HistoryModelWatchApp(
        id: 2,
        name: "Barata",
        title: "a Barata",
        navTitle: "a Barata",
        lisfOfInstruments: [
            InstrumentModel(id: 0, name: "Chocalho", image: "Chocalho", challenge: "Baixe o braço"),
            InstrumentModel(id: 1, name: "Flauta", image: "Flauta", challenge: "Baixe o braço"),
            InstrumentModel(id: 2, name: "Pandeiro", image: "Pandeiro", challenge: "Baixe o braço"),
            InstrumentModel(id: 3, name: "Piano", image: "Piano", challenge: "Baixe o braço"),
            InstrumentModel(id: 4, name: "Saxofone", image: "Saxofone", challenge: "Baixe o braço"),
            InstrumentModel(id: 5, name: "Violão", image: "Violao", challenge: "Baixe o braço")
        ]
    )
]
