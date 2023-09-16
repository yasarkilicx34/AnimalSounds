//
//  AnimalButton.swift
//  AnimalSound
//
//  Created by yasarkilic on 15.09.2023.
//
import SwiftUI

struct AnimalButton: View {
    
    let animalName: String
    let animalSound: String
    let animalGroup: String
    let animalDescription: String
    let buttonColor: Color
  
    
    @EnvironmentObject var audioManager: AudioManager
    @State private var showInfoSheet = false
    @State private var isPlaying = false
    
    var body: some View {
        Button(action: {
            showInfoSheet.toggle()
        }) {
            HStack {
                Image(animalName.lowercased())
                    .resizable()
                    
                    .frame(width: 70, height: 70)
                   
                
                VStack(alignment: .leading) {
                    Text(animalName.uppercased())
                        .font(.custom("Marker Felt", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(y: -15)
                    
                    Text("🔊Sound: \(animalSound)")
                        .font(.custom("Marker Felt", size: 20))
                        .foregroundColor(.white)
                        .offset(y: -11)
                    
                    Text("Group: \(animalGroup)")
                        .font(.custom("Marker Felt", size: 13))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Button(action: {
                    if isPlaying {
                        audioManager.stopPlaying()
                    } else {
                        audioManager.playSound(forAnimal: animalName)
                    }
                    isPlaying.toggle()
                }) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 29, height: 29)
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 18)
            .padding(.horizontal, 10)
            .background(buttonColor)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
        .onChange(of: audioManager.isPlaying) { newIsPlaying in
            if !newIsPlaying {
                isPlaying = false
            }
        }
        .sheet(isPresented: $showInfoSheet) {
            AnimalInfoSheet(animalName: animalName,
                            animalSound: animalSound,
                            animalGroup: animalGroup,
                            animalDescription: animalDescription,
                            backgroundColor: buttonColor)
        }
    }
}
