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
    var id: Int
    
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
                if color == Color(.white) {
                    DispatchQueue.main.async {
                        vm.playerSquares[id-1].color = Color(.red)
                    }
                    
                }
            }
            .onAppear {
                tapabilityCheck()
            }
            
          
    }
}

struct SquareView_Previews: PreviewProvider {
    
    static var color = Color(.white)//Color(red: 1.0, green: 0.0, blue: 0.0)
    static var text = "?"
    static var id = 2
    
    static var previews: some View {
        SquareView(color: color, text: text, id: id)
            .environmentObject(ViewModel())
    }
}
