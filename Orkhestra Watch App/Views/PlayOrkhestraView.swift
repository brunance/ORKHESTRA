//
//  PlayOrkhestraView.swift
//  orkhestraWatch Watch App
//
//  Created by Bruno França do Prado on 20/11/22.
//

import SwiftUI

struct PlayOrkhestraView: View {
    @ObservedObject var hvm: HistoryViewModel = HistoryViewModel.shared
    @State var progress: Double = 0
    @EnvironmentObject var audioManager: AudioManagerWatch
    @State var isPlaying: Bool = true

    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()

    var body: some View {
//        let currentInstrument = historyList[hvm.historyId]
//                                    .lisfOfInstruments
//                                    .first(where: {
//                                        $0.id == hvm.instrumentId
//                                    })
        let currentHistory = historyList[hvm.historyId]
        let currentInstrument = currentHistory.lisfOfInstruments[hvm.instrumentId]

        NavigationView {
            VStack {
                ZStack {
                    CircularProgressView(progress: progress, strokeLine: 5)

                    Image(currentInstrument.image)
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .frame(width: 50, height: 50)
                
                Text(historyList[hvm.historyId].title)
                    .font(.system(size: 15))
                
                Text("\(currentInstrument.name) Instrumental")
                    .font(.system(size: 10))
                
                HStack {
                    Button(action: {
//                        progress += 1/10
                        audioManager.pauseSound()
                        isPlaying.toggle()
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("Destaque1"))
                            
                            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                .font(.system(size: 25))
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 50)
                    .padding(.top, 5)
                }
            }
            .onAppear {
                audioManager.playSound(sound: "\(currentHistory.name)-\(currentInstrument.image)")
            }
            .onDisappear {
                audioManager.stopSound()
            }
            .onReceive(timer) { _ in
                guard let player = audioManager.player else { return }
                progress = player.currentTime / player.duration

                if progress == 0.0 {
                    isPlaying = false
                }
            }
        }
        .navigationBarTitle(currentInstrument.name)
    }
}

struct PlayOrkhestraView_Previews: PreviewProvider {
    static var previews: some View {
        PlayOrkhestraView()
    }
}
