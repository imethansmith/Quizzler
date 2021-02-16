//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressPerQuestion = 1.0 / Float(quiz.count)
        progressBar.progress = progressPerQuestion
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // Assign binary conversion on answer given
        let answer = { () -> Int in
            if (sender.currentTitle == "True") {
                return 1
            } else {
                return 0
            }
        }()
        
        // Check answer validity
        // Show if answer is right or wrong
        if (answer == quiz[questionNumber].answer) {
            userScore += 1
            sender.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            UIView.animate(withDuration: 0.8) {
                sender.backgroundColor = UIColor.clear
            }
        } else {
            sender.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            UIView.animate(withDuration: 0.8) {
                sender.backgroundColor = UIColor.clear
            }
        }
        
        // Update UI with next question
        questionNumber += 1
        if questionNumber < quiz.count {
            updateUI()
            
        } else {
            // Complete quiz, update look of app, hide buttons until restart
            progressBar.progress = 1.0
            progressBar.progressTintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            questionLabel.text = "Congratulations!\nYou got \(userScore) of \(quiz.count) answers correct!"
            trueButton.isHidden = true
            falseButton.isHidden = true
            restartButton.isHidden = false
        }
        
        // Show current score
        print(userScore)
    }
    
    func updateUI() {
        // Update current question on main Label
        questionLabel.text = (quiz[questionNumber].text)
        progressBar.progress = progressPerQuestion * Float(questionNumber)
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        // Reset values
        userScore = 0
        questionNumber = 0
        progressBar.tintColor = #colorLiteral(red: 1, green: 0.4588235294, blue: 0.6588235294, alpha: 1)
        progressBar.progress = progressPerQuestion
        
        // Show buttons
        trueButton.isHidden = false
        falseButton.isHidden = false
        
        // Restart views
        restartButton.isHidden = true
        updateUI()
    }
}

