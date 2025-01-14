//
//  SoundsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/13/25.
//

import SwiftUI
import AVKit

class SoundManager {
    // Make the soundManager available to use in any view in the app.
    static let instance = SoundManager()
    // Var to hold AVPlayer
    var player: AVAudioPlayer?
    enum SoundOption: String {
        case Tada
        case Badum
    }
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound \(error.localizedDescription)")
        }
    }
}

struct SoundsBootcamp: View {

    var body: some View {
        VStack (spacing: 40) {
            
            Button("Play Sound 1") {
                SoundManager.instance.playSound(sound: .Tada)
            }
            
            Button("Play Sound 2") {
                SoundManager.instance.playSound(sound: .Badum)
            }
        }
    }
}

#Preview {
    SoundsBootcamp()
}
