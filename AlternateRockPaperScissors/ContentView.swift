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
    @State private var win = Bool.random()
    @State private var userInput = ""
    
    var body: some View {
        NavigationView {
            VStack{
                if win {
                    Text("Please try to win!")
                    HStack{
                        ForEach(0..<3) { number in
                            Button {
                                self.userInput = gameLogic(number)
                                self.opponentsSelection = Int.random(in: 0...2)
                                win.toggle()
                            } label: {
                                Image(rockPaperScissors[number])
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                            }
                        }
                        Text(userInput)
                    }
                    VStack {
                        Text("Your opponent has selected:")
                            Button {
                            } label: {
                                Image(rockPaperScissors[opponentsSelection])
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                            }
                        Text("Your score is: \(score)/10")
                    }
                        .navigationTitle("Rock, Paper, Scissors")
                } else {
                    Text("Please try to lose!")
                    HStack{
                        ForEach(0..<3) { number in
                            Button {
                                self.userInput = gameLogic(number)
                                self.opponentsSelection = Int.random(in: 0...2)
                                win.toggle()
                            } label: {
                                Image(rockPaperScissors[number])
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                            }
                        }
                        Text(userInput)
                    }
                    VStack {
                        Text("Your opponent has selected:")
                            Button {
                            } label: {
                                Image(rockPaperScissors[opponentsSelection])
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                            }
                        Text("Your score is: \(score)/10")
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
              score += 1
              return "You scored a point!"
            case ("Rock", "Scissors", true):
              score += 1
              return "You scored a point!"
            case ("Scissors", "Paper", true):
              score += 1
              return "You scored a point!"
            // Player picks incorrectly on win turn
            case ("Paper", "Scissors", true):
              score -= 1
              return "You lost a point!"
            case ("Rock", "Paper", true):
              score -= 1
              return "You lost a point!"
            case ("Scissors", "Rock", true):
              score -= 1
              return "You lost a point!"
            // Player picks correctly on lose turn
            case ("Rock", "Paper", false):
              score += 1
              return "You scored a point!"
            case ("Scissors", "Rock", false):
              score += 1
              return "You scored a point!"
            case ("Paper", "Scissors", false):
              score += 1
              return "You scored a point!"
            // Player picks incorrectly on lose turn
            case ("Paper", "Rock", false):
              score -= 1
              return "You lost a point!"
            case ("Rock", "Scissors", false):
              score -= 1
              return "You lost a point!"
            case ("Scissors", "Paper", false):
              score -= 1
              return "You lost a point!"
            // Player picks the same choice
            default:
              return "It's a draw!"
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
