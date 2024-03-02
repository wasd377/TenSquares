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
    
    var body: some View {
        if side == "master" {
            HStack{
                VStack {
                    Text("Master")
                    ForEach(vm.masterSquares, id: \.id) { square in
                        
                        SquareView(color: square.color, id: square.id)
                        
                    }
                }
    
            }
        }
        if side == "player" {
            HStack{
                VStack {
                    Text("Player")
                    ForEach(vm.playerSquares, id: \.self) { square in
                                SquareView(color: square.color, id: square.id)
                        }
                    
                }
              
    
            }
            .onTapGesture {
                vm.objectWillChange.send()
                vm.playerSquares[5].color = Color(.red)
               
            }
        }
    }
}

struct SideView_Previews: PreviewProvider {
    
    static var side = "player"
    
    static var previews: some View {
        SideView(side: side)
            .environmentObject(ViewModel())
    }
}
