//
//  CountDownView.swift
//  Challenge05
//
//  Created by Anna Alicia Milani on 10/11/22.
//

import SwiftUI

struct CountDownView: View {
    @State private var isShowingDetailView = false
    @State var countDownTimer = 3
    @State var timerRunning = true
    @State var scale: CGFloat = 1
    @Binding var isGameView: Bool
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @ObservedObject var hvm: HistoryViewModel = HistoryViewModel.shared
    @EnvironmentObject var audioManager: AudioManager

    var body: some View {

        let currentHistory = historyList[hvm.historyId]

        NavigationView {
            ZStack {
                Color("CombinarText").ignoresSafeArea()
                Image("\(currentHistory.name)Padrao")
                    .resizable()
                VStack {
                    ZStack {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 200))
                            .foregroundColor(Color("CircleCount"))
                            .scaleEffect(scale)
                            .opacity(Double(2 - scale))
                            .onAppear {
                                audioManager.playSound(sound: "countdown")
                                let baseAnimation = Animation.easeInOut(duration: 0.9)
                                let repeated = baseAnimation.repeatForever(autoreverses: false)
                                withAnimation(repeated) {
                                    scale += 1
                                }
                            }
                        Text("\(countDownTimer)")
                            .onReceive(timer) { _ in
                                if countDownTimer > 1 && timerRunning {
                                    audioManager.playSound(sound: "countdown")
                                    countDownTimer -= 1
                                } else {
                                    isShowingDetailView = true
                                    timerRunning = false
                                }
                            }
                            .font(.custom("RubikBubbles-Regular", size: 100))
                            .foregroundColor(Color("CombinarText"))
                            .frame(width: 200, height: 200)
                            .background(Color("CircleCount"))
                            .clipShape(Circle())

                        if isGameView {
                            // swiftlint:disable:next line_length
                            NavigationLink(destination: GameView().navigationBarBackButtonHidden(true), isActive: $isShowingDetailView) {}
                                .isDetailLink(false)
                        } else {
                            // swiftlint:disable:next line_length
                            NavigationLink(destination: OrchestraView().navigationBarBackButtonHidden(true), isActive: $isShowingDetailView) {}
                                .isDetailLink(false)
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}
