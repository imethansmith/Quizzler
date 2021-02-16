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
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create initial progress bar
        progressBar.progress = quizBrain.progressPerQuestion
        
        // Setup first question
        updateUI(nextQuestion: quizBrain.quiz[0].text)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // Assign binary conversion on answer given
        let answer = { () -> Bool in
            if (sender.currentTitle == "True") {
                // if true, return one
                return true
            } else {
                // if false, return 0
                return false
            }
        }()
        
        // Pass result to model, update View with result
        if quizBrain.checkAnswer(answer) {
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
        
        // Update UI with next question, or display final result
        updateUI(nextQuestion: quizBrain.getNextQuestion())
        
        // Quiz completion: Update look of app, hide buttons until restart
        if (quizBrain.questionNumber == 0) {
            progressBar.progress = 1.0
            progressBar.progressTintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            trueButton.isHidden = true
            falseButton.isHidden = true
            restartButton.isHidden = false
        }
    }
    
    func updateUI(nextQuestion: String) {
        // Update current question on main Label
        questionLabel.text = (nextQuestion)
        
        // Update progress bar
        progressBar.progress = quizBrain.progressPerQuestion * Float(quizBrain.questionNumber)
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        // Reset values
        quizBrain.resetGame()
        
        // Reset UI
        progressBar.progressTintColor = #colorLiteral(red: 1, green: 0.4588235294, blue: 0.6588235294, alpha: 1)
        progressBar.progress = quizBrain.progressPerQuestion
        
        // Show buttons
        trueButton.isHidden = false
        falseButton.isHidden = false
        
        // Restart views
        restartButton.isHidden = true
        updateUI(nextQuestion: quizBrain.quiz[0].text)
    }
}

