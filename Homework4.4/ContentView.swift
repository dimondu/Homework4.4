//
//  ContentView.swift
//  Homework4.4
//
//  Created by Дмитрий Дуров on 19.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue: Float = 50.0
    var body: some View {
        VStack {
            
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                
                SliderUIKIT(value: $currentValue)
                    
            
                Text("100")
                
            
            }
            .padding()
            Button("Проверь меня!") {
            print("hello")
            }
            .padding(.bottom, 20)
            
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
        
    }
//    private func computeScore() -> Int {
//        let difference = abs(targetValue - lround(Double(currentValue)))
//        return 100 - difference
//    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
