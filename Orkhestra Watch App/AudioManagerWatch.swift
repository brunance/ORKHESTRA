//
//  AudioManagerWatch.swift
//  orkhestraWatch Watch App
//
//  Created by Anna Alicia Milani on 22/11/22.
//

import Foundation
import AVKit
import AVFAudio
final class AudioManagerWatch: ObservableObject {
//    static let shared = AudioManager()

    var player: AVAudioPlayer?
    var isPlayingSound: Bool = false

    func playSound(sound: String) {
        guard let path = Bundle.main.path(forResource: sound, ofType: "mp3") else {
            print("Resource not found: \(sound)")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player?.play()
        } catch {
            print("ERROR")
        }
    }

    func pauseSound() {
        guard let player = player else {
            print("Instance of audio player not found")
            return
        }

        if player.isPlaying {
            isPlayingSound = false
            player.pause()
        } else {
            isPlayingSound = true
            player.play()
        }
    }

    func stopSound() {
        guard let player = player else { return }

        if player.isPlaying {
            player.stop()
        }
    }
}

