//
//  ContentView.swift
//  Recycle Rangers 1
//
//  Created by Aisha Ali on 12/11/2023.
//

import SwiftUI

struct ContentView: View {
//    private let data: [Int] = Array(1...3)
    private let colors: [Color] = [.red, .green, .blue, .yellow]
    
    private let numberColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    private let fixedColumns = [
        GridItem(.fixed(200)),
        GridItem(.fixed(200))
    ]
    
    var body: some View {
        TabView {
            LearnView()
                .tabItem {
                    Label("Learn", systemImage: "lightbulb")
                    
                }
            PlayView()
                .tabItem {
                    Label("Play", systemImage: "gamecontroller.fill")
                }
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
