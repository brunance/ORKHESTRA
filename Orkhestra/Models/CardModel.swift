//
//  CardModel.swift
//  Challenge05
//
//  Created by Anna Alicia Milani on 08/11/22.
//

import Foundation
import SwiftUI

class CardModel: Identifiable, ObservableObject {
    var id = UUID()
    @Published var isFaceUp = false
    @Published var isMatched = false
    var text: String
    var sound: String?

    init(text: String, sound: String?) {
        self.text = text
        self.sound = sound
    }

    func turnOver() {
        self.isFaceUp.toggle()
    }
}

let cardValues: [String] = [
    "Chocalho", "Flauta", "Pandeiro", "Piano", "Saxofone", "Violao"
]

let cardSounds: [String] = [
    "Chocalho", "Flauta", "Pandeiro", "Piano", "Sax", "Violão"
]

func createCardList() -> [CardModel] {
    var cardList = [CardModel]()
    for count in 0...cardValues.count - 1 {
        cardList.append(CardModel(text: cardValues[count], sound: cardSounds[count]))
        cardList.append(CardModel(text: cardValues[count], sound: cardSounds[count]))
    }
    return cardList
}

let faceDownCard = CardModel(text: "?", sound: nil)
