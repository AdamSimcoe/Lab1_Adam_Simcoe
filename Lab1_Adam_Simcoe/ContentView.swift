// Created by Adam Simcoe - 101442161
// Last Updated on February 12th, 2025

import SwiftUI

struct ContentView: View {
    
    @State private var currentNum = Int.random(in: 1...100)
    @State private var correctGuesses = 0
    @State private var wrongGuesses = 0
    @State private var attempts = 0
    @State private var showScore = false
    @State private var isGuessCorrect = false
    
    var body: some View {
        VStack {
            
            Text("\(currentNum)")
            
            VStack {
                
                // Prime Button
                Button(action: {
                    // Check user input
                    checkAnswer(userInput: true)
                }) {
                    Text("Prime")
                }
                
                Button(action: {
                    // Check user input
                    checkAnswer(userInput: false)
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
    
    // Check if user's input is correct
    func checkAnswer(userInput: Bool) {
        
        // Check users' input with the isPrime func and return true or false
        isGuessCorrect = (userInput == isPrime(currentNum))
        
        // Increases guess count for final scoring based off result
        if isGuessCorrect {
            correctGuesses += 1
        } else {
            wrongGuesses += 1
        }
        
        // Runs next num func
        nextNum()
    }
    
    // Changes to the next number if attempts have not reached 10
    func nextNum() {
        attempts += 1
        
        // Displays final score if 10 attempts have passed
        if attempts == 10 {
            showScore = true
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // Generates new random num from 1 to 100
                currentNum = Int.random(in: 1...100)
            }
        }
    }
}

