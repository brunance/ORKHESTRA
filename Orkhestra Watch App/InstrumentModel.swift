//
//  InstrumentModel.swift
//  orkhestraWatch Watch App
//
//  Created by Anna Alicia Milani on 19/11/22.
//

import Foundation
import SwiftUI

struct InstrumentModel: Identifiable, Hashable {
    var id: Int
    var name: String
    var image: String

    init(id: Int, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}

let instrumentsList: [InstrumentModel] = [
    InstrumentModel(id: 0, name: "Chocalho", image: "Chocalho"),
    InstrumentModel(id: 1, name: "Flauta", image: "Flauta"),
    InstrumentModel(id: 2, name: "Pandeiro", image: "Pandeiro"),
    InstrumentModel(id: 3, name: "Piano", image: "Piano"),
    InstrumentModel(id: 4, name: "Saxofone", image: "Saxofone"),
    InstrumentModel(id: 5, name: "Violão", image: "Violao")
]
