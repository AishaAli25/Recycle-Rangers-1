//
//  PlayView.swift
//  Recycle Rangers 1
//
//  Created by Aisha Ali on 12/11/2023.
//

import SwiftUI

struct PlayView: View {
    
    var questions = [Question(title: "Where would you place a hot regular non-laminated karak cup?",
                              option1: "Plastic",
                              option2: "Paper",
                              option3: "Glass",
                              option4: "Metal",
                              correctOption: 2),
                     Question(title: "Where would you place a Masafi water bottle?",
                              option1: "Plastic",
                              option2: "Metal",
                              option3: "Organic",
                              option4: "Paper",
                              correctOption: 1),
                     Question(title: "Where would you place an empty cough medicine vial?",
                              option1: "Paper",
                              option2: "Glass",
                              option3: "Metal",
                              option4: "Other",
                              correctOption: 2),
                     Question(title: "Where would you put aluminum foil wrap?",
                              option1: "Plastic",
                              option2: "Glass",
                              option3: "Paper",
                              option4: "Metal",
                              correctOption: 4),
                     Question(title: "Where do you put the leftovers of your sandwich?",
                              option1: "General",
                              option2: "Plastic",
                              option3: "Metal",
                              option4: "Organic",
                              correctOption: 4),
                     Question(title: "Where do you put a laminated cereal box?",
                              option1: "Plastic",
                              option2: "Glass",
                              option3: "General",
                              option4: "Paper",
                              correctOption: 3),
                     Question(title: "Where do we place empty cardboard?",
                              option1: "Paper",
                              option2: "Plastic",
                              option3: "Glass",
                              option4: "General",
                              correctOption: 1)
    ]
    
    @State private var currentQuestion = 0
    
    @State private var isAlertPresented = false
    @State private var isCorrect = false
    
    @State private var correctAnswers = 0
    @State private var isModalPresented = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Recycle Ranger, test yourself and answer these questions as fast as you can correctly!")
                        .font(.title3)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.cyan)
                        .padding(5)
                    ProgressView(value: Double(currentQuestion),
                                 total: Double(questions.count))
                    .padding()
                    
                    Text(questions[currentQuestion].title)
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(-2)
                    
                    HStack {
                        VStack {
                            Button {
                                didTapOption(optionNumber: 1)
                            } label: {
                                Image(systemName: "triangle.fill")
                                Text(questions[currentQuestion].option1)
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .background(.red)
                            .foregroundColor(.white)
                            .font(.title2)
                            .cornerRadius(4)
                            
                            Button {
                                didTapOption(optionNumber: 2)
                            } label: {
                                Image(systemName: "circle.fill")
                                Text(questions[currentQuestion].option2)
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .background(.green)
                            .foregroundColor(.white)
                            .font(.title2)
                            .cornerRadius(4)
                            
                        }
//                                            .padding()
                        
                        VStack {
                            Button {
                                didTapOption(optionNumber: 3)
                            } label: {
                                Image(systemName: "diamond.fill")
                                Text(questions[currentQuestion].option3)
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .background(.yellow)
                            .foregroundColor(.white)
                            .font(.title2)
                            .cornerRadius(4)
                            
                            Button {
                                didTapOption(optionNumber: 4)
                            } label: {
                                Image(systemName: "square.fill")
                                Text(questions[currentQuestion].option4)
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .foregroundColor(.white)
                            .font(.title2)
                            .cornerRadius(4)
                        }
                        //                    .padding()
                        
                    }
                    .padding()
                }
                .navigationTitle("Play 🎮")
                .font(.headline)
                .padding()
                }
                .alert(isCorrect ? "Correct" : "Wrong", isPresented: $isAlertPresented) {
                    Button("OK") {
                        currentQuestion += 1
                        if currentQuestion == questions.count {
                            isModalPresented = true
                            currentQuestion = 0
                        }
                    }
                } message: {
                    Text(isCorrect ? "Congrats, you are a true RECYCLE RANGER!" : "Uh Oh. Try again!")
                }
                .sheet(isPresented: $isModalPresented,
                       onDismiss: {
                    correctAnswers = 0
                },
                       content: {
                    ScoreView(score: correctAnswers,
                              totalQuestions: questions.count)
                })
            }
        }
        
        func didTapOption(optionNumber: Int) {
            if optionNumber == questions[currentQuestion].correctOption {
                print("Correct!")
                isCorrect = true
                correctAnswers += 1
            } else {
                print("Wrong!")
                isCorrect = false
            }
            isAlertPresented = true
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

