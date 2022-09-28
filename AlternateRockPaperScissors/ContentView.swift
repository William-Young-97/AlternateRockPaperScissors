//
//  ContentView.swift
//  AlternateRockPaperScissors
//
//  Created by EngineerBetter on 28/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rockPaperScissors = ["Paper", "Rock", "Scissors"].shuffled()
    
    var body: some View {
        let opponentsSelection = rockPaperScissors.randomElement()
        NavigationView {
            VStack{
                Text("Your opponent has select:")
                    Button {
                    } label: {
                        Image(opponentsSelection ?? "Failed to unwrap")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                    }
            }
        .navigationTitle("Rock, Paper, Scissors")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
