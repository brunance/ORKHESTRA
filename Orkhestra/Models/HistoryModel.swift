//
//  HistoryModelWatchApp.swift
//  orkhestraWatch Watch App
//
//  Created by Anna Alicia Milani on 18/11/22.
//

import Foundation
import SwiftUI


struct HistoryModel: Identifiable, Hashable {
    var id: Int
    var name: String
    var title: String
    var navTitle: String
    var lisfOfInstruments: [InstrumentModel]
    var titleList: [String]
    var sizeTitleList: [Float]
    var description: String
    
    init(id: Int, name: String, title: String, navTitle: String, lisfOfInstruments: [InstrumentModel], titleList: [String], sizeTitleList: [Float], description: String) {
        self.id = id
        self.name = name
        self.title = title
        self.navTitle = navTitle
        self.lisfOfInstruments = lisfOfInstruments
        self.titleList = titleList
        self.sizeTitleList = sizeTitleList
        self.description = description
    }
}


class HistoryList:ObservableObject{
    
   
    public static var shared: HistoryList = HistoryList()
    
    var historyList: [HistoryModel] = [

        HistoryModel(
            id: 0,
            name: "Aranha",
            title: "a dona Aranha",
            navTitle: "a D. Aranha",
            lisfOfInstruments: [
                InstrumentModel(id: 0, name: "Chocalho", image: "Chocalho", challenge: "Gire o Pulso", unlock: false),
                InstrumentModel(id: 1, name: "Flauta", image: "Flauta", challenge: "Gire o Pulso", unlock: false),
                InstrumentModel(id: 2, name: "Pandeiro", image: "Pandeiro", challenge: "Gire o Pulso", unlock: false),
                InstrumentModel(id: 3, name: "Piano", image: "Piano", challenge: "Gire o Pulso", unlock: false),
                InstrumentModel(id: 4, name: "Saxofone", image: "Saxofone", challenge: "Gire o Pulso", unlock: false),
                InstrumentModel(id: 5, name: "Violão", image: "Violao", challenge: "Gire o Pulso", unlock: false)
            ],
            titleList: ["a dona", "Aranha"],
            sizeTitleList: [32, 48],
            description: "A previsão de hoje é de chuva forte, ajude a teimosa dona Aranha a subir pela parede. Nesta dinâmica musical de jogo da memória você deve combinar os pares para desbloquear novos sons e quem sabe a música inteira."
        ),

        HistoryModel(
            id: 1,
            name: "Borboleta",
            title: "a Borboleta",
            navTitle: "a Borboleta",
            lisfOfInstruments: [
                InstrumentModel(id: 0, name: "Chocalho", image: "Chocalho", challenge: "Leve a mão ao peito", unlock: false),
                InstrumentModel(id: 1, name: "Flauta", image: "Flauta", challenge: "Leve a mão ao peito", unlock: false),
                InstrumentModel(id: 2, name: "Pandeiro", image: "Pandeiro", challenge: "Leve a mão ao peito", unlock: false),
                InstrumentModel(id: 3, name: "Piano", image: "Piano", challenge: "Leve a mão ao peito", unlock: false),
                InstrumentModel(id: 4, name: "Saxofone", image: "Saxofone", challenge: "Leve a mão ao peito", unlock: false),
                InstrumentModel(id: 5, name: "Violão", image: "Violao", challenge: "Leve a mão ao peito", unlock: false)
            ],
            titleList: ["a", "Borboleta"],
            sizeTitleList: [32, 48],
            description: "Olha a borboleta tá na cozinha! Vamos ajudá-la a fazer um chocolate para sua madrinha? Nesta dinâmica musical de jogo da memória você deve combinar os pares para desbloquear novos sons e quem sabe a música inteira."
        ),

        HistoryModel(
            id: 2,
            name: "Barata",
            title: "a Barata",
            navTitle: "a Barata",
            lisfOfInstruments: [
                InstrumentModel(id: 0, name: "Chocalho", image: "Chocalho", challenge: "Levante o braço", unlock: false),
                InstrumentModel(id: 1, name: "Flauta", image: "Flauta", challenge: "Levante o braço", unlock: false),
                InstrumentModel(id: 2, name: "Pandeiro", image: "Pandeiro", challenge: "Levante o braço", unlock: false),
                InstrumentModel(id: 3, name: "Piano", image: "Piano", challenge: "Levante o braço", unlock: false),
                InstrumentModel(id: 4, name: "Saxofone", image: "Saxofone", challenge: "Levante o braço", unlock: false),
                InstrumentModel(id: 5, name: "Violão", image: "Violao", challenge: "Levante o braço", unlock: false)
            ],
            titleList: ["a", "Barata", "diz que tem"],
            sizeTitleList: [32, 48, 32],
            description: "Ajude a desmascarar as mentiras da Barata numa dinâmica musical de jogo da memória onde você deve combinar os pares para desbloquear novos sons e quem sabe a música inteira."
        )
    ]

}
