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
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Your opponent has select:")
                    Button {
                    } label: {
                        Image(rockPaperScissors[opponentsSelection])
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                    }
                Text("Please select your choice:")
                HStack{
                    ForEach(0..<3) { number in
                        Button {
                            gameLogic(number)
                        } label: {
                            Image(rockPaperScissors[number])
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                    }
                }
            }
        .navigationTitle("Rock, Paper, Scissors")
        }
    }
    
    func gameLogic(_ number: Int) {
        if number == opponentsSelection {
            score += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
