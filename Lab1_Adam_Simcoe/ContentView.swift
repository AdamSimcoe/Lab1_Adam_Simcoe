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
    @State private var timer: Timer?
    @State private var showResult = false
    
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
            
            Image(systemName: isGuessCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundColor(isGuessCorrect ? .green : .red)
        }
        
        // calls timer to start when view appears
        .onAppear {
            startTimer()
        }
        
        // Alert to print final score after 10 attempts
        .alert(isPresented: $showScore) {
            Alert(
                title: Text("Your Score:"),
                message: Text("Correct Guesses: \(correctGuesses)\nWrong Guesses: \(wrongGuesses)"),
                dismissButton: .default(Text("Ok")) {
                    // Reset game after user input
                    resetGame()
                }
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
        
        // Show checkmark or x mark
        showResult = true
        
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
                
                // Hides checkmark or x mark
                showResult = false
                
                // Restarts timer
                startTimer()
            }
        }
    }
    
    func startTimer() {
        // Ensures no duplicate timers are occuring
        stopTimer()
        
        // Sets up timer with 5s interval
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
            
            // Incrememnts wrong guess count by 1 if no user input
            wrongGuesses += 1
            
            // Sets guess to incorrect if no input is given
            isGuessCorrect = false
            
            // Displays x mark
            showResult = true
            
            // Runs next num func
            nextNum()
        }
    }
    
    // Stops the timer
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    // Resets the game
    func resetGame() {
        // Stops any timers
        stopTimer()
        
        // Resets guesses and attempts to 0
        correctGuesses = 0
        wrongGuesses = 0
        attempts = 0
        
        // Sets up new random num
        currentNum = Int.random(in: 1...100)
        
        // Hides checkmark or x mark
        showResult = false
        
        // Starts the timer again
        startTimer()
    }
}

