//
//  CardView.swift
//  Challenge05
//
//  Created by Anna Alicia Milani on 08/11/22.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var card: CardModel
    @Binding var matchedCards: [CardModel]
    @Binding var userChoices: [CardModel]
    @EnvironmentObject var audioManager: AudioManager
    @ObservedObject var hvmGame: GameViewModel = GameViewModel.shared

    let width: Int = 100
    let height: Int = 90

    var body: some View {
        if card.isFaceUp || matchedCards.contains(where: {$0.id == card.id}) {

            ZStack {
                Rectangle()
                    .frame(width: CGFloat(width), height: CGFloat(width))
                    .foregroundColor(Color("TitleHistory"))
                    .cornerRadius(10)
                Image("BarataGameCard")
                    .resizable()
                    .frame(width: CGFloat(width), height: CGFloat(width))
                    .cornerRadius(10)
                Image(card.text)
                    .resizable()
                    .frame(width: CGFloat(width)/1.5, height: CGFloat(width)/1.5)
                    .background(Color("TitleHistory"))
                    .cornerRadius(10)
                    .onAppear(perform: {
                        playSoundOfCard(card: card)
                    })
                    .onTapGesture {
                        playSoundOfCard(card: card)
                    }
            }

        } else {
            Image("Carta")
                .resizable()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .onTapGesture {
                    if hvmGame.isClickable {
                        if userChoices.count == 0 {
                            card.turnOver()
                            userChoices.append(card)
                        } else if userChoices.count == 1 {
                            hvmGame.isClickable = false
                            card.turnOver()
                            userChoices.append(card)
                            withAnimation(Animation.linear.delay(1)) {
                                for thisCard in userChoices {
                                    thisCard.turnOver()
                                }
                            }
                            checkForMatch()
                        }
                    }
                }
        }
    }
    func checkForMatch() {
        if userChoices[0].text == userChoices[1].text {
            matchedCards.append(userChoices[0])
            matchedCards.append(userChoices[1])
            playSoundOfCard(card: userChoices[0])
        }
        userChoices.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            hvmGame.isClickable = true
        }
    }

    func playSoundOfCard(card: CardModel) {
        guard let titleOfSound = card.sound else {
                return
        }
        audioManager.playSound(sound: titleOfSound)
    }
}
