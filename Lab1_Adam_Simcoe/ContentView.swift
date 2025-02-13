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
    
    // Check if the current number is prime or not prime
    func isPrime(_ num: Int) -> Bool {
        
        // Returns not prime to numbers <= 1
        guard num > 1 else { return false }
        
        // Loop from 2 to the current num - 1
        for i in 2..<num {
            // Check to see if num is divisible by any number in range
            if num % i == 0 {
                // if divisible, return not prime
                return false
            }
        }
        
        // Return prime if not
        return true
    }
}

