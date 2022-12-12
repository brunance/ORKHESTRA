//
//  AudioManager.swift
//  Challenge05
//
//  Created by Anna Alicia Milani on 09/11/22.
//

import Foundation
import AVKit

final class AudioManager: ObservableObject {
//    static let shared = AudioManager()

    var player: AVAudioPlayer?

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
            player.pause()
        } else {
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
