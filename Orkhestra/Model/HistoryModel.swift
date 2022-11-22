//
//  HistoryModel.swift
//  Challenge05
//
//  Created by Anna Alicia Milani on 14/11/22.
//

import Foundation
import SwiftUI

struct HistoryModel: Identifiable, Hashable {
    var id: Int
    var name: String
    var title: String
    var titleList: [String]
    var sizeTitleList: [Float]
    var description: String

    init(id: Int, name: String, title: String, titleList: [String], sizeTitleList: [Float], description: String) {
        self.id = id
        self.name = name
        self.title = title
        self.titleList = titleList
        self.sizeTitleList = sizeTitleList
        self.description = description
    }
}

let historyList: [HistoryModel] = [

    // swiftlint:disable:next line_length
    HistoryModel(id: 0, name: "Aranha", title: "a dona Aranha", titleList: ["a dona", "Aranha"], sizeTitleList: [32, 48], description: "A previsão de hoje é de chuva forte, ajude a teimosa dona Aranha a subir pela parede. Nesta dinâmica musical de jogo da memória você deve combinar os pares para desbloquear novos sons e quem sabe a música inteira."),

    // swiftlint:disable:next line_length
    HistoryModel(id: 1, name: "Borboleta", title: "a Borboleta", titleList: ["a", "Borboleta"], sizeTitleList: [32, 48], description: "Olha a borboleta tá na cozinha! Vamos ajudá-la a fazer um chocolate para sua madrinha? Nesta dinâmica musical de jogo da memória você deve combinar os pares para desbloquear novos sons e quem sabe a música inteira."),

    // swiftlint:disable:next line_length
    HistoryModel(id: 2, name: "Barata", title: "a Barata diz que tem", titleList: ["a", "Barata", "diz que tem"], sizeTitleList: [32, 48, 32], description: "Ajude a desmascarar as mentiras da Barata numa dinâmica musical de jogo da memória onde você deve combinar os pares para desbloquear novos sons e quem sabe a música inteira.")
]
