//
//  SquareView.swift
//  TenSquares
//
//  Created by Natalia D on 29.02.2024.
//

import SwiftUI

struct SquareView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var squareSize = CGFloat(50)
  
    @State var color: Color
    @State var text = ""
    @State var showingCredits = false
    @State var colorSelected = false
    
    var id: Int
    var side: String
    
    func tapabilityCheck() {
        if color == Color(.white) {
           text = "?"
        } else {
            text = ""
        }
    }
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 15)
            .fill(color)
            .frame(width: squareSize, height: squareSize)
            .overlay(
                    Text(text)
                        .bold()
                    , alignment: .center
                     
                )
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                     .stroke(.black, lineWidth: 3)
            )
            .onTapGesture{
                if side == "Player" {
                    showingCredits.toggle()
                }
            }
            .onAppear {
                tapabilityCheck()
            }
            .sheet(isPresented: $showingCredits) {
                Text("Choose the color of the square:")
                
                // Формируем список квадратиков в 2 ряда, чтобы точно все на экране поместилось.
                VStack {
                    HStack {
                        ForEach(0..<5) { number in
                            RoundedRectangle(cornerRadius: 15)
                                .fill(vm.colors[number])
                                .frame(width: squareSize, height: squareSize)
                                .onTapGesture{
                                    color = vm.colors[number]
                                    vm.playerSquares[id-1].color = color
                                    text = ""
                                    showingCredits.toggle()
                                }
                        }
                    }
                      
                        HStack {
                            ForEach(5..<10) { number in
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(vm.colors[number])
                                    .frame(width: squareSize, height: squareSize)
                                    .onTapGesture{
                                        color = vm.colors[number]
                                        vm.playerSquares[id-1].color = color
                                        text = ""
                                        showingCredits.toggle()
                                    }
                            }
                        }
                    }
                .presentationDetents([.fraction(0.3)])
               
                }
                   
            
          
    }
}

struct SquareView_Previews: PreviewProvider {
    
    static var color = Color(.white)//Color(red: 1.0, green: 0.0, blue: 0.0)
    static var text = "?"
    static var id = 2
    static var side = "Player"
    
    static var previews: some View {
        SquareView(color: color, text: text, id: id, side: side)
            .environmentObject(ViewModel())
    }
}
