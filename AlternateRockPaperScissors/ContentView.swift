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
                Text("Please select your choice:")
                HStack{
                    ForEach(0..<3) { number in
                        Button {
                            self.userInput = gameLogic(number)
                        } label: {
                            Image(rockPaperScissors[number])
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                    }
                    Text(userInput)
                }
                Text("Your opponent has select:")
                    Button {
                    } label: {
                        Image(rockPaperScissors[opponentsSelection])
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                    }
            }
        .navigationTitle("Rock, Paper, Scissors")
        }
    }
    
    func gameLogic(_ number: Int) -> String {
        if number == opponentsSelection {
            score += 1
        }
        if rockPaperScissors[number] == "Paper" {
            return "Clicked paper"
        } else if rockPaperScissors[number] == "Scissors" {
            return "Clicked Scissors"
        }
        else {
            return "Clicked Rock"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
