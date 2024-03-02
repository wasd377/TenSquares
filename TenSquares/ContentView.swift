//
//  ContentView.swift
//  TenSquares
//
//  Created by Natalia D on 29.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm : ViewModel
    
    @State var gameState = "generating"
    @State var result = 0
    
    func calculateResult() {
        for result in 0...9 {
            if vm.masterSquares[result].color == vm.playerSquares[result].color {
                self.result += 1
            }
        }
    }
    
    var body: some View {
        
        VStack {
            Text("You have to remember the colors of 10 squares of Master list and then repeat them.")
                .fixedSize(horizontal: false, vertical: true)
                .padding([.leading, .trailing], 20)
                .multilineTextAlignment(.center)
            if gameState == "generating" {
                Spacer()
                SideView(side: "master")
                Spacer()
                Button("Ready!") {
                    gameState = "playing"
                }
            } else if gameState == "playing" {
                Spacer()
                SideView(side: "player")
                Spacer()
                Button("Done!") {
                    gameState = "checking"
                    calculateResult()
                }
                
            } else if gameState == "checking" {
                Spacer()
                HStack{
                    Spacer()
                    SideView(side: "master")
                    Spacer()
                    SideView(side: "player")
                    Spacer()
               
                }
                Text("Result: \(result) / 10")
                Spacer()
                Button("New game!") {
                    vm.loadSquares()
                    gameState = "generating"
                }
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
