//
//  VIewModel.swift
//  TenSquares
//
//  Created by Natalia D on 29.02.2024.
//

import Foundation
import SwiftUI

class InitialSettings {
    
}

struct Square: Identifiable, Hashable {
    var id: Int
    var color: Color
}

class ViewModel: ObservableObject {
    
    var colors = [Color(.red),
                  Color(.orange),
                  Color(.yellow),
                  Color(.green),
                  Color(.cyan),
                  Color(.blue),
                  Color(red: 0.65, green: 0.1, blue: 0.9),
                  Color(red: 1, green: 0.5, blue: 0.75),
                  Color(red: 0.04, green: 0.30, blue: 0.13),
                  Color(.black)]
    @Published var masterSquares: [Square] = []
    @Published var playerSquares: [Square] = []
    @Published var gameResult = 0
    
    init() {
       loadSquares()
    }
    
    func loadSquares() {
        masterSquares = []
        for color in colors.shuffled() {
            self.masterSquares.append(Square(id: masterSquares.count+1, color: color))
        }
        playerSquares = []
        for square in 1...10 {
            self.playerSquares.append(Square(id: playerSquares.count+1, color: Color(.white)))
        }
    }
    
    func calculateResult() {
        
        gameResult = 0
        
        for result in 0...9 {
            if masterSquares[result].color == playerSquares[result].color {
                gameResult += 1
            }
        }
    }
}
