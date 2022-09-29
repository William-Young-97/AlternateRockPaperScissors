//
//  ContentView.swift
//  AlternateRockPaperScissors
//
//  Created by EngineerBetter on 28/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rockPaperScissors = ["Paper", "Rock", "Scissors"].shuffled()
    @State private var opponentsSelection = Int.random(in: 0...2)
    @State private var score = 0
    @State private var totalTaps = 0
    @State private var win = Bool.random()
    @State private var gameComplete = false
    @State private var userInput = ""
    
    var body: some View {
        NavigationView {
            VStack{
                if win {
                    Text("Please try to win!")
                        .padding(15)
                    HStack{
                        ForEach(0..<3) { number in
                            Button {
                                self.userInput = gameLogic(number)
                                self.opponentsSelection = Int.random(in: 0...2)
                                win.toggle()
                                if totalTaps == 10 {
                                    gameCompleteTrue()
                                }
                            } label: {
                                Image(rockPaperScissors[number])
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                            }
                        }
                    }
                    VStack {
                        Text("Your opponent has selected:")
                            .padding(15)
                            Button {
                            } label: {
                                Image(rockPaperScissors[opponentsSelection])
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                            }
                            .padding(20)
                        Text("Your score is: \(score)/10")
                    }
                    .padding(20)
                    Text(userInput)
                    .alert("Game Over!", isPresented: $gameComplete) {
                        Button("Reset", action: reset)
                        } message: {
                            Text("You scored is \(score)/10")
                        }
                        .navigationTitle("Rock, Paper, Scissors")
                } else {
                    Text("Please try to lose!")
                        .padding(15)
                    HStack{
                        ForEach(0..<3) { number in
                            Button {
                                self.userInput = gameLogic(number)
                                self.opponentsSelection = Int.random(in: 0...2)
                                win.toggle()
                                if totalTaps == 10 {
                                    gameCompleteTrue()
                                }
                            } label: {
                                Image(rockPaperScissors[number])
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                            }
                            .padding(20)
                        }
                    }
                    VStack {
                        Text("Your opponent has selected:")
                            .padding(15)
                            Button {
                            } label: {
                                Image(rockPaperScissors[opponentsSelection])
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                            }
                            .padding(20)
                        Text("Your score is: \(score)/10")
                    }
                    .padding(20)
                    Text(userInput)
                    .alert("Game Over!", isPresented: $gameComplete) {
                        Button("Reset", action: reset)
                        } message: {
                            Text("You scored is \(score)/10")
                        }
                        .navigationTitle("Rock, Paper, Scissors")
                    }
                }
            }
        }
    
    func gameLogic(_ number: Int) -> String {
        switch (rockPaperScissors[number], rockPaperScissors[opponentsSelection], win) {
            // Player picks correctly on win turn
            case ("Paper", "Rock", true):
                totalTaps += 1
                score += 1
                return "You scored a point!"
            case ("Rock", "Scissors", true):
                totalTaps += 1
                score += 1
                return "You scored a point!"
            case ("Scissors", "Paper", true):
                totalTaps += 1
                score += 1
                return "You scored a point!"
            // Player picks incorrectly on win turn
            case ("Paper", "Scissors", true):
                totalTaps += 1
                score -= 1
                return "You lost a point!"
            case ("Rock", "Paper", true):
                totalTaps += 1
                score -= 1
                return "You lost a point!"
            case ("Scissors", "Rock", true):
                totalTaps += 1
                score -= 1
                return "You lost a point!"
            // Player picks correctly on lose turn
            case ("Rock", "Paper", false):
                totalTaps += 1
                score += 1
                return "You scored a point!"
            case ("Scissors", "Rock", false):
                totalTaps += 1
                score += 1
                return "You scored a point!"
            case ("Paper", "Scissors", false):
                totalTaps += 1
                score += 1
                return "You scored a point!"
            // Player picks incorrectly on lose turn
            case ("Paper", "Rock", false):
                totalTaps += 1
                score -= 1
                return "You lost a point!"
            case ("Rock", "Scissors", false):
                totalTaps += 1
                score -= 1
                return "You lost a point!"
            case ("Scissors", "Paper", false):
                totalTaps += 1
                score -= 1
                return "You lost a point!"
            // Player picks the same choice
            default:
                totalTaps += 1
                return "It's a draw!"
            }
        }
    func gameCompleteTrue() {
        gameComplete = true
    }
    
    func reset() {
        gameComplete = false
        userInput = ""
        score = 0
        totalTaps = 0
    }
    
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
