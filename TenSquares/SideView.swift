//
//  SideView.swift
//  TenSquares
//
//  Created by Natalia D on 02.03.2024.
//

import SwiftUI

struct SideView: View {
    
    @EnvironmentObject var vm : ViewModel
    
    var side: String
    @State var text = "test"
    
    struct CardView: View {
        var body: some View {
            GeometryReader { gp in
                VStack {
                    VStack {
                        Text("Blue")
                    }
                    .frame(width: gp.size.width, height: gp.size.height * 0.7)
                    .background(Color.blue)
                    VStack {
                        Text("Red")
                    }
                    .frame(width: gp.size.width, height: gp.size.height * 0.3)
                    .background(Color.red)
                }
            }
            .frame(height: 280).frame(maxWidth: .infinity)
            .cornerRadius(24).padding(.horizontal, 30)
        }
    }
    
    var body: some View {
        
            if side == "Master" {
              
                    VStack {
                        Text("Master")
                        VStack{
                            HStack {
                                ForEach(vm.masterSquares, id: \.self) { square in
                                    if square.id <= 5 {
                                        SquareView(color: square.color, id: square.id, side: "Master")
                                    }
                                }
                            }
                            HStack {
                                ForEach(vm.masterSquares, id: \.self) { square in
                                    if square.id > 5 {
                                        SquareView(color: square.color, id: square.id, side: "Master")
                                    }
                                }
                            }
                        }
                    }
                    
                
            }
            if side == "Player" {
                
            
                    VStack {
                        Text("Player")
                        
                            VStack{
                                HStack {
                                    ForEach(vm.playerSquares, id: \.self) { square in
                                        if square.id <= 5 {
                                            SquareView(color: square.color, id: square.id, side: "Player")
                                        }
                                    }
                                }
                                HStack {
                                    ForEach(vm.playerSquares, id: \.self) { square in
                                        if square.id > 5 {
                                            SquareView(color: square.color, id: square.id, side: "Player")
                                        }
                                    }
                                }
                            }
                        }
                       
                        
                   
                    
                    
                
            }
        
        
    }
}

struct SideView_Previews: PreviewProvider {
    
    static var side = "Player"
    
    static var previews: some View {
        SideView(side: side)
            .environmentObject(ViewModel())
    }
}
