//
//  ContentView.swift
//  Homework4.4
//
//  Created by Дмитрий Дуров on 19.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 3.0
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                SliderUIKIT(value: $currentValue, opacity: CGFloat(computeScore()))
                Text("100")
            }
            .padding()
            
            Button("Проверь меня!") {
                self.showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Your score"),
                      message: Text("\(computeScore())"),
                      dismissButton: .default(Text("Ok")))
            }
            .padding()
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
        
    }
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
