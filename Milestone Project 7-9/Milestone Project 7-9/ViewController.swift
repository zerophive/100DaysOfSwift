//
//  ViewController.swift
//  Milestone Project 7-9
//
//  Created by oaccamsrazor on 28.3.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

// All the GCD code needs rethinking, what a mess
// too many sections mixed together, view, model and controller are not distinct enough.

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
	var score: Int = 0 {
		didSet {
			updateScore()
		}
	}
	
	var alphabet = [String]()
	var allWords = [String]()

	override func loadView() {
		view = UIView()
		view.backgroundColor = .white

		performSelector(inBackground: #selector(loadFiles), with: nil)

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
		
		for row in 0..<4 {
			let rStackView = UIStackView()
			rStackView.axis = .horizontal
			rStackView.alignment = .fill
			rStackView.distribution = .fillEqually
			
			for _ in 0..<(row < 2 ? 7 : 6) {
				let button = UIButton(type: .system)
				button.layer.borderWidth = 1
				button.layer.borderColor = UIColor.gray.cgColor
				button.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
				button.setTitle("?", for: .normal)
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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "reset", style: .done, target: self, action: #selector(reStartGame))
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "clue", style: .plain, target: self, action: #selector(showClue))
//		print(navigationItem.leftBarButtonItem?.view)
	}
	
	// MARK: - @objc methods
	@objc func loadFiles() {
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
		
		if let alphabetFileURL = Bundle.main.url(forResource: "alphabet", withExtension: "txt") {
			if let theLetters = try? String(contentsOf: alphabetFileURL) {
				
				alphabet = theLetters.components(separatedBy: "\n")
			}
		}

		loadLetterButtons()
		startGame()
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
		sender.isEnabled = false
		
		checkIfWon()
	}
	
	@objc func moreKillHangman() {
		DispatchQueue.main.async {
			self.deadMan.image = UIImage(named: "hangman\(self.wrongGuesses)")
			self.checkHangingState()
		}
	}
	
	@objc func resetLetters() {
		DispatchQueue.main.async {
			for button in self.letterButtons {
				button.isEnabled = true
			}
		}
	}
	
	@objc func reStartGame() {
		wrongGuesses = 0
		startGame()
	}
	
	@objc func showClue() {
		let ac = UIAlertController(title: "You are really stupid…", message: "\(currentGameWord)", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "play on", style: .default))
		present(ac, animated: true)
	}

	// MARK: - methods
	func startGame() {
		moreKillHangman()
		resetLetters()
		score = 0

		currentGameWord = allWords.removeFirst()
		
		spacedGuessWord = Array(repeating: "_ ", count: currentGameWord.count).joined()
		updateGuessWord()
	}
	
	func reStartGameUI(_ action: UIAlertAction?) {
		reStartGame()
	}

	func loadLetterButtons() {
		DispatchQueue.main.async { [weak self] in
			for (index, button) in self!.letterButtons.enumerated() {
				button.setTitle("\(self!.alphabet[index])", for: .normal)
			}
		}
	}
	
	func updateScore() {
		DispatchQueue.main.async {
			self.title = "Score: \(self.score)"
		}
	}

	func checkHangingState() {
		if wrongGuesses == 7 {
			score -= 1
			deadMan.image = UIImage(named: "hangman\(wrongGuesses + 1)")
			let ac = UIAlertController(title: "You Killed Him!!", message: "don't kill people", preferredStyle: .alert)
			ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: reStartGameUI))
			present(ac, animated: true)
		}
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
			ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: reStartGameUI))
			present(ac, animated: true)
		}
	}
}
