//
//  test.swift
//  TenSquares
//
//  Created by Natalia D on 02.03.2024.
//

import SwiftUI

struct test: View {
    
    @State var fruits = ["apple", "orange"]
    
    var body: some View {
        VStack {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit)
                
            }
       
        Button("add new") {
            fruits[0] = "lemon"
            fruits.append("watermelon")
        }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
