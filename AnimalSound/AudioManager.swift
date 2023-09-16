//
//  AudioManager.swift


import Foundation
import AVFoundation

class AudioManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var isPlaying: Bool = false
    
    private var audioPlayer: AVAudioPlayer?
    
    override init() {
        super.init()
    }
    
    func playSound(forAnimal animal: String) {
        if let path = Bundle.main.path(forResource: animal.lowercased(), ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.delegate = self
                audioPlayer?.play()
                isPlaying = true
            } catch {
                print("Ses çalınamadı.")
                isPlaying = false
            }
        }
    }
    
    func stopPlaying() {
        audioPlayer?.stop()
        isPlaying = false
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
    }
}
