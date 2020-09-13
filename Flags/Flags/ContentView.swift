//
//  ContentView.swift
//  Flags
//
//  Created by Akhilesh Gandotra on 28/02/20.
//  Copyright © 2020 Akhilesh Gandotra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    
    
    struct FlagImage: View {
        var imageName: String
        var body: some View {
            return Image(imageName)
                .renderingMode(.original)
                .overlay(Capsule().strokeBorder(Color.black))
                .clipShape(Capsule())
                .shadow(radius: 2.0)
        }
    }
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black,.blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack( spacing: 30) {
                Text("Tap the right flag").foregroundColor(.white).font(.title)
                Text("\(countries[correctAnswer])").foregroundColor(.white).font(.largeTitle).fontWeight(.black)
                VStack(spacing: 20) {
                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            self.checkAnswer(number: number)
                        }) {
                           FlagImage(imageName: self.countries[number])
                        }
                    }
                    Spacer()
                    
                }
                
            }
            
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
                })
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func checkAnswer(number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score+=3
        } else {
            scoreTitle = "Wrong"
            score-=2
        }
        showingScore = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


