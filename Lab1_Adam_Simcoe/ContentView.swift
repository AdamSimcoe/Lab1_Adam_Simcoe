// Created by Adam Simcoe - 101442161
// Last Updated on February 12th, 2025

import SwiftUI

struct ContentView: View {
    
    @State private var currentNum = Int.random(in: 1...100)
    @State private var correctGuesses = 0
    @State private var wrongGuesses = 0
    @State private var attempts = 0
    @State private var showScore = false
    
    var body: some View {
        VStack {
            
            Text("\(currentNum)")
            
            VStack {
                
                // Prime Button
                Button(action: {
                    // Check user input
                }) {
                    Text("Prime")
                }
                
                Button(action: {
                    // Check user input
                }) {
                    Text("Not Prime")
                }
            }
            
            // Checkmark here
        }
        
        .alert(isPresented: $showScore) {
            Alert(
                title: Text("Your Score:"),
                message: Text("Correct Guesses: \(correctGuesses)\nWrong Guesses: \(wrongGuesses)"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}

