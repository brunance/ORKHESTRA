//
//  OrchestraView.swift
//  Challenge05
//
//  Created by Anna Alicia Milani on 11/11/22.
//

import SwiftUI

struct OrchestraView: View {
    @ObservedObject var hvm: HistoryViewModel = HistoryViewModel.shared
    @State private var showingHistory = false
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @EnvironmentObject var audioManager: AudioManager
    @ObservedObject var hl: HistoryList = HistoryList.shared

    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()

    var body: some View {
        let currentHistory = hl.historyList[hvm.historyId]

        NavigationView {
            ZStack {
                Color.combinarText.ignoresSafeArea()
                Image("\(currentHistory.name)Padrao")
                    .resizable()

                VStack(spacing: 20) {
                    ZStack {
                        Button(action: {
                            audioManager.stopSound()
                            showingHistory = true
                        }, label: {
                            ZStack {
                                Image(systemName: "chevron.down.circle.fill")
                                    .frame(alignment: .trailing)
                                    .font(.system(size: 37))
                                    .foregroundStyle(Color.circleCount)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        })

                        Text("Orkhéstra")
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                            .foregroundColor(Color.titleOrchestra)
                    }
                    Image("\(currentHistory.name)Orquestra")
                        .frame(width: 358, height: 334)
                        .background(Color.backImageOrchestra)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                    Text(currentHistory.title)
                        .font(.custom("RubikBubbles-Regular", size: 24))
                        .foregroundColor(Color.titleHistory)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)

                    VStack(spacing: 5) {
                        Slider(value: $value, in: 0...(audioManager.player?.duration ?? 0)) { editing in

                            isEditing = editing

                            if !editing {
                                audioManager.player?.currentTime = value
                            }
                        }
                        .accentColor(Color.destaque1)
                        .tint(Color.destaque1)

                        HStack {
                            // swiftlint:disable:next line_length
                            Text(DateComponentsFormatter.positional.string(from: (audioManager.player?.currentTime ?? 0)) ?? "0:00")

                            Spacer()

                            // swiftlint:disable:next line_length
                            Text(DateComponentsFormatter.positional.string(from: (audioManager.player?.duration ?? 0)) ?? "0:00")
                        }
                        .font(.system(size: 12))
                        .foregroundColor(Color.titleOrchestra)
                    }
                    VStack {
                        Button(action: {
                            audioManager.pauseSound()
                        }, label: {
                            // swiftlint:disable:next line_length
                            Image(systemName: (audioManager.player?.isPlaying ?? false) ? "pause.circle.fill" : "play.circle.fill")
                                .font(.system(size: 75))
                                .foregroundColor(Color.playButton)
                        })
                        Text((audioManager.player?.isPlaying ?? false) ? "Pausar" : "Tocar")
                            .font(.system(size: 12))
                            .foregroundColor(Color.titleOrchestra)
                    }
                }
                .padding(20)
                // swiftlint:disable:next line_length
                NavigationLink(destination: HistoryView().navigationBarBackButtonHidden(true), isActive: $showingHistory) {}
            }
            .ignoresSafeArea()
            .onAppear {
                audioManager.playSound(sound: "\(currentHistory.name)Musica")
            }
            .onReceive(timer) { _ in
                guard let player = audioManager.player, !isEditing else { return }
                value = player.currentTime
            }
        }
    }
}

struct OrquestraView_Previews: PreviewProvider {
    static var previews: some View {
        OrchestraView()
    }
}
