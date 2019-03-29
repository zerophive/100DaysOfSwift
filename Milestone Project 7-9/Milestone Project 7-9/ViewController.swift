//
//  ViewController.swift
//  Milestone Project 7-9
//
//  Created by oaccamsrazor on 28.3.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var guessWordLabel: UILabel!
	var deadMan: UIImageView!
	var buttonsView: UIStackView!
	var letterButtons = [UIButton]()
	
	var currentGameWord = ""
	var spacedGuessWord = "_ _ _ _ _"
	var correctLetters = [String]()

	var wrongGuesses = 0
	var score = 0
	
	var alphabet = [String]()
	var allWords = [String]()

	override func loadView() {
		view = UIView()
		view.backgroundColor = .white

		loadAlphabet()
		performSelector(inBackground: #selector(loadWordFiles), with: nil)

		deadMan = UIImageView()
		deadMan.translatesAutoresizingMaskIntoConstraints = false
		deadMan.image = UIImage(named: "hangman\(wrongGuesses)")
		view.addSubview(deadMan)
		
		guessWordLabel = UILabel()
		guessWordLabel.translatesAutoresizingMaskIntoConstraints = false
		guessWordLabel.font = UIFont.systemFont(ofSize: 48)
		guessWordLabel.text = spacedGuessWord
		view.addSubview(guessWordLabel)
		
		
		buttonsView = UIStackView()
		buttonsView.translatesAutoresizingMaskIntoConstraints = false
		buttonsView.axis = .vertical
		buttonsView.alignment = .fill
		buttonsView.distribution = .fillEqually
		
		for row in 0..<2 {
			let rStackView = UIStackView()
			rStackView.axis = .horizontal
			rStackView.alignment = .fill
			rStackView.distribution = .fillEqually
			
			for col in 0..<7 {
				let button = UIButton(type: .system)
				button.layer.borderWidth = 1
				button.layer.borderColor = UIColor.gray.cgColor
				button.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
				button.setTitle("\(alphabet[row * 7 + col])", for: .normal)
				letterButtons.append(button)
				rStackView.addArrangedSubview(button)
			}
			
			buttonsView.addArrangedSubview(rStackView)
		}
		
		for row in 2..<4 {
			let rStackView = UIStackView()
			rStackView.axis = .horizontal
			rStackView.alignment = .fill
			rStackView.distribution = .fillEqually
			
			for col in 0..<6 {
				let button = UIButton(type: .system)
				button.layer.borderWidth = 1
				button.layer.borderColor = UIColor.gray.cgColor
				button.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
				button.setTitle("\(alphabet[row * 6 + col + 2])", for: .normal)
				letterButtons.append(button)
				rStackView.addArrangedSubview(button)
			}
			
			buttonsView.addArrangedSubview(rStackView)
		}
		
		view.addSubview(buttonsView)
		
		NSLayoutConstraint.activate([
			deadMan.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
			deadMan.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
			deadMan.widthAnchor.constraint(equalTo: view.widthAnchor),
		])
		
		NSLayoutConstraint.activate([
			guessWordLabel.topAnchor.constraint(equalTo: deadMan.bottomAnchor),
			guessWordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
		
		NSLayoutConstraint.activate([
			buttonsView.topAnchor.constraint(equalTo: guessWordLabel.bottomAnchor, constant: 20),
			buttonsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1),
			buttonsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -1),
			buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
		])
		
	}
	
//	override func viewDidLoad() {
//		super.viewDidLoad()
//
//	}
	
	// MARK: - @objc methods
	@objc func loadAlphabet() {
		if let alphabetFileURL = Bundle.main.url(forResource: "alphabet", withExtension: "txt") {
			if let theLetters = try? String(contentsOf: alphabetFileURL) {
				
				alphabet = theLetters.components(separatedBy: "\n")
			}
		}
	}
	
	@objc func loadWordFiles() {
		var tmpAllWords = [String]()
		
		if let wordsFileURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
			if let theWords = try? String(contentsOf: wordsFileURL) {
				tmpAllWords = theWords.components(separatedBy: "\n")
			}
		}
		
		for i in 0..<tmpAllWords.count {
			if tmpAllWords[i].count > 4 {
				allWords.append(tmpAllWords[i].lowercased())
			}
		}
		
		allWords.shuffle()
		startGame(nil)
	}
	
	@objc func letterTapped(_ sender: UIButton) {
		guard let buttonTitle = sender.titleLabel?.text else { return }

		if !currentGameWord.contains(buttonTitle) {
			wrongGuesses += 1
			moreKillHangman()
		} else {
			correctLetters.append(buttonTitle)
			spacedGuessWord = ""
			for letter in currentGameWord {
				if correctLetters.contains(String(letter)) {
					spacedGuessWord += "\(letter) "
				} else {
					spacedGuessWord += "_ "
				}
			}
			updateGuessWord()
		}
		sender.isHidden = true
		
		checkIfWon()
	}
	
	@objc func moreKillHangman() {
		deadMan.image = UIImage(named: "hangman\(wrongGuesses)")
		
		if wrongGuesses == 7 {
			deadMan.image = UIImage(named: "hangman\(wrongGuesses + 1)")
			let ac = UIAlertController(title: "You Killed Him!!", message: "don't kill people", preferredStyle: .alert)
			ac.addAction(UIAlertAction(title: "Play Again?", style: .default, handler: startGame))
			present(ac, animated: true)
		}
	}
	
	@objc func resetLetters() {
		for button in letterButtons {
			button.isHidden = false
		}
	}
	
	@objc func updateScore() {
		title = "Score \(score)"
	}

	// MARK: - methods
	func startGame(_ action: UIAlertAction?) {
		wrongGuesses = 0
		performSelector(onMainThread: #selector(moreKillHangman), with: nil, waitUntilDone: false)
		performSelector(onMainThread: #selector(resetLetters), with: nil, waitUntilDone: false)
		performSelector(onMainThread: #selector(updateScore), with: nil, waitUntilDone: false)

		currentGameWord = allWords.removeFirst()
		
		spacedGuessWord = Array(repeating: "_ ", count: currentGameWord.count).joined()
		updateGuessWord()
	}
	
	
	func updateGuessWord() {
		spacedGuessWord = spacedGuessWord.trimmingCharacters(in: .whitespaces)
		
		DispatchQueue.main.async { [weak self] in
			self?.guessWordLabel.text = self?.spacedGuessWord
		}

	}
	
	func checkIfWon() {
		if !spacedGuessWord.contains("_") {
			score += 1
			let ac = UIAlertController(title: "YOU WON!!", message: nil, preferredStyle: .alert)
			ac.addAction(UIAlertAction(title: "Play Again?", style: .default, handler: startGame))
			present(ac, animated: true)
		}
	}
}
