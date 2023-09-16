//
//  RootView.swift
//  AnimalSound
//
//  Created by yasarkilic on 16.09.2023.
//

import SwiftUI

struct RootView: View {
    @State private var isActive = false
    
    var body: some View {
        Group {
            if isActive {
                HomePage() 
            } else {
                SplashScreenView(isActive: $isActive)
            }
        }
    }
}

struct SplashScreenView: View {
    @Binding var isActive: Bool
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        VStack {
            VStack {
                Image("SplashScreen")
                    .resizable()
                    .frame(width: 440, height: 420)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.9)) {
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) {
                self.isActive = true
            }
        }
    }
}
