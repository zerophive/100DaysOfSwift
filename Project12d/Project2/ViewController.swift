//
//  ViewController.swift
//  Project2
//
//  Created by oaccamsrazor on 7.3.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var button1: UIButton!
	@IBOutlet var button2: UIButton!
	@IBOutlet var button3: UIButton!
	
	var countries = [String]()
	var score = 0
	var currentHighScore = 0
	var correctAnswer = 0
	var questionCount = 0
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "score: \(score)", style: .plain, target: self, action: nil)
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "reset", style: .plain, target: self, action: #selector(resetGameQuestion))
//		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showScore))

		countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
		
		button1.layer.borderWidth = 1
		button2.layer.borderWidth = 1
		button3.layer.borderWidth = 1
		
		button1.layer.borderColor = UIColor.lightGray.cgColor
		button2.layer.borderColor = UIColor.lightGray.cgColor
		button3.layer.borderColor = UIColor.lightGray.cgColor

		askQuestion()
	}

	func askQuestion(action: UIAlertAction! = nil) {
		
		if questionCount == 10 {
			let alertTitle = "Final Score"
			let alertMessage = String(score)
			let actionTitle = "Play again"
			
			currentHighScore = score
			
			questionCount = 0
			score = 0
			
			let ac = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
			ac.addAction(UIAlertAction(title: actionTitle, style: .default, handler: checkHighScore))
			present(ac, animated: true)
		}

		countries.shuffle()
		correctAnswer = Int.random(in: 0...2)
		navigationItem.rightBarButtonItem?.title = "score: \(score)"
		
		button1.setImage(UIImage(named: countries[0]), for: .normal)
		button2.setImage(UIImage(named: countries[1]), for: .normal)
		button3.setImage(UIImage(named: countries[2]), for: .normal)
		
		title = countries[correctAnswer].uppercased()
	}

	@IBAction func buttonTapped(_ sender: UIButton) {
		let actionTitle = "Continue"
		var alertTitle: String
		var alertMessage: String? = nil
		
		questionCount += 1
		
		if sender.tag == correctAnswer {
			alertTitle = "Correct"
			score += 1
		} else {
			alertTitle = "Wrong!"
			alertMessage = "You selected the flag of " + countries[sender.tag].uppercased()
			score -= 1
		}
		
		let ac = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: actionTitle, style: .default, handler: askQuestion))
		present(ac, animated: true)
	}
	
//	@objc func showScore() {
//		let alertTite = "Score"
//		let actionTitle = String(score)
//		
//		let ac = UIAlertController(title: alertTite, message: nil, preferredStyle: .alert)
//		ac.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
//		present(ac, animated: true)
//	}
	
	@objc func resetGameQuestion() {
		let alertTitle = "Reset Gamne?"
		let alertMessage = "Your score is \(score).\nResetting the game will result in loosing your score."
		let actionTitle = "Reset"
		
		let ac = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .actionSheet)
		ac.addAction(UIAlertAction(title: actionTitle, style: .destructive, handler: resetGame))
		ac.addAction(UIAlertAction(title: "Keep Playing", style: .cancel, handler: nil))
		present(ac, animated: true)
	}
	
	@objc func checkHighScore(action: UIAlertAction! = nil) {
		let defaults = UserDefaults.standard
		let oldHighScore = defaults.integer(forKey: "highScore")

		if currentHighScore > oldHighScore {
			defaults.set(currentHighScore, forKey: "highScore")
			let ac = UIAlertController(title: "New High Score", message: "\(currentHighScore)", preferredStyle: .alert)
			ac.addAction(UIAlertAction(title: "Continue", style: .default))
			present(ac, animated: true)
		}
	}
	
	func resetGame(action: UIAlertAction! = nil) {
		questionCount = 0
		score = 0

		askQuestion()
	}
}

