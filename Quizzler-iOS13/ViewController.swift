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
    
    let quiz = [["Is Ricardo sexy?", 1],
                ["Ethan is bald.", 1],
                ["The sun is blue.", 0],
                ["Cat's legitimately have nine lives.", 0]
    ]
    
    var questionNumber = 0
    var userScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        var answer = 0
        // Assign binary conversion on answer given
        if (sender.currentTitle == "True") {
            answer = 1
        } else {
            answer = 0
        }
        
        // Check answer validity
        if (answer == quiz[questionNumber][1] as! Int) {
            userScore += 1
            print("Right")
        } else {
            print("Wrong")
        }
        
        // Update UI with next question
        questionNumber += 1
        if questionNumber < quiz.count {
            questionLabel.text = (quiz[questionNumber][0] as! String)
        } else {
            // Complete quiz
            questionNumber = 0
            questionLabel.text = "Completed quiz!"
        }
        print(userScore)
    }
    
    func updateUI() {
        questionLabel.text = (quiz[questionNumber][0] as! String)
    }
}

