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
    
    var body: some View {
        
        VStack {
            Text("You have to remember the colors of 10 squares of Master list and then repeat them.")
                .fixedSize(horizontal: false, vertical: true)
                .padding([.leading, .trailing], 20)
                .multilineTextAlignment(.center)
            if gameState == "generating" {
                Spacer()
                SideView(side: "Master")
                Spacer()
                Button("Ready!") {
                    gameState = "playing"
                }
            } else if gameState == "playing" {
                Spacer()
                SideView(side: "Player")
                Spacer()
                Button("Done!") {
                    gameState = "checking"
                    vm.calculateResult()
                }
                
            } else if gameState == "checking" {
                Spacer()
                HStack{
                    Spacer()
                    SideView(side: "Master")
                    Spacer()
                    SideView(side: "Player")
                    Spacer()
               
                }
                Spacer()
                Text("Result: \(vm.gameResult) / 10")
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
