//
//  LearnView.swift
//  Recycle Rangers 1
//
//  Created by Aisha Ali on 12/11/2023.
//

import SwiftUI

struct LearnView: View {
    private let data: [Int] = Array(1...4)
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
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundColor(colors[number%4])
                                .cornerRadius(15)
//                            Text("\(number)")
//                                .foregroundColor(.white)
//                                .font(.system(size: 70, design: .rounded))
                            HStack(alignment: .center) {
                              Image("recycling icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 70)
                              Text("How do we recycle?")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title2)
                                Spacer(minLength: 0)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Learn 📝")
            .font(.headline)
            .padding()
            .foregroundColor(.blue)
            
        }
    }
    
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
