//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Ethan Smith on 16/02/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "A slug's blood is green.", a: 1),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: 1),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: 1),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: 1),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: 0),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: 1),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: 0),
        Question(q: "Google was originally called 'Backrub'.", a: 1),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: 1),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: 0),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: 0),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: 1)
        
    ]
    
    var questionNumber = 0
    var userScore = 0
    var progressPerQuestion: Float = 0.0
    
    init() {
        // Calculate the change in progress bar per question answered
        progressPerQuestion = 1.0 / Float(quiz.count)
    }
    
    mutating func checkAnswer(_ answer: Int) -> Bool {
        // Check answer validity, is it right or wrong?
        if (answer == quiz[questionNumber].answer) {
            userScore += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func getNextQuestion() -> String {
        // Update question number and return current question
        if questionNumber < (quiz.count - 1) {
            questionNumber += 1
            return quiz[questionNumber].text
        } else {
            // If questions exhausted, return final results
            questionNumber = 0
            return "Congratulations!\nYou got \(userScore) of \(quiz.count) answers correct!"
        }
    }
    
    mutating func resetGame() {
        // Reset all variables to start new game
        userScore = 0
        questionNumber = 0
    }
}
