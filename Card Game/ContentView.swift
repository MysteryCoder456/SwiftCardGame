//
//  ContentView.swift
//  Card Game
//
//  Created by Harmeet on 07/26/2020.
//

import SwiftUI

enum Suite: String, CaseIterable {
    case Clubs = "C"
    case Spades = "S"
    case Hearts = "H"
    case Diamonds = "D"
}

struct GameView: View {
    @State private var leftCard: String = "blue_back"
    @State private var rightCard: String = "blue_back"
    
    @State private var playerPoints: Int = 0
    @State private var CPUPoints: Int = 0

    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                HStack(alignment: .center, spacing: 20) {
                    Image(leftCard)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                    Image(rightCard)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.all, 25)
                
                Button(action: dealCards) {
                    Text("Deal Cards")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .padding(10)
                        .border(Color.blue, width: 5)
                }
            }
            
            Spacer()
            
            HStack {
                Text("Player Score: \(playerPoints)")
                Spacer()
                Text("CPU Score: \(CPUPoints)")
            }
        }
    }
    
    func dealCards() {
        // Deal Left Card
        let leftCardNumber = Int.random(in: 1...13)
        let leftCardSuite = Suite.allCases.randomElement()?.rawValue
        leftCard = String(leftCardNumber) + String(leftCardSuite!)
        
        // Deal Right Card
        let rightCardNumber = Int.random(in: 1...13)
        let rightCardSuite = Suite.allCases.randomElement()?.rawValue
        rightCard = String(rightCardNumber) + String(rightCardSuite!)
        
        if leftCardNumber > rightCardNumber {
            playerPoints += 1
        }
        else if leftCardNumber < rightCardNumber {
            CPUPoints += 1
        }
        
        print("dealing cards...")
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
