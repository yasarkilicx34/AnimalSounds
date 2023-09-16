//
//  AnimalSoundApp.swift
//  AnimalSound
//
//  Created by yasarkilic on 14.09.2023.
//
import AVFoundation
import SwiftUI

@main
struct AnimalSoundApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(AudioManager()) 
        }
    }
}
