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
    
    let quiz = [
        Question(text: "Ricardo is sexy", answer: 1),
        Question(text: "Ethan is bald", answer: 1),
        Question(text: "The sun is blue", answer: 0),
        Question(text: "Cat's really have nine lives", answer: 0)
    ]
    
    var questionNumber = 0
    var userScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        if (answer == quiz[questionNumber].answer) {
            userScore += 1
            print("Right")
        } else {
            print("Wrong")
        }
        
        // Update UI with next question
        questionNumber += 1
        if questionNumber < quiz.count {
            questionLabel.text = (quiz[questionNumber].text)
        } else {
            // Complete quiz
            questionNumber = 0
            questionLabel.text = (quiz[questionNumber].text)
        }
        print(userScore)
    }
    
    func updateUI() {
        questionLabel.text = (quiz[questionNumber].text)
    }
}

