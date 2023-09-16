//
//  AnimalInfoSheet.swift
//  AnimalSound
//
//  Created by yasarkilic on 15.09.2023.
//

import SwiftUI
import Foundation


struct AnimalInfoSheet: View {
    let animalName: String
    let animalSound: String
    let animalGroup: String
    let animalDescription: String
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(animalName.lowercased())
                    .resizable()
                    
                    .frame(width: 150, height: 150)
                   
                
                Text(animalName.uppercased())
                    .font(.custom("Marker Felt", size: 40))
                    .foregroundColor(.white)
                    .padding(.bottom, 3)
                
                
                Text("Description: \(animalDescription)")
                    .font(.custom("Marker Felt", size: 20))
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
        }
    }
}
