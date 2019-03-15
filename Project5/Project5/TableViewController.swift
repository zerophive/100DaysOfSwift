//
//  TableViewController.swift
//  Project5
//
//  Created by oaccamsrazor on 14.3.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
	var allWords = [String]()
	var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "restart", style: .plain, target: self, action: #selector(startGame))
		
		if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
			if let startWords = try? String(contentsOf: startWordsURL) {
				allWords = startWords.components(separatedBy: "\n")
			}
		}
		
		if allWords.isEmpty {
			allWords = ["silkworm"]
		}
		
		startGame()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usedWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "word", for: indexPath)
		cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }

	@objc func startGame() {
		title = allWords.randomElement()
		usedWords.removeAll(keepingCapacity: true)
		tableView.reloadData()
	}
	
	@objc func promptForAnswer() {
		let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
		ac.addTextField()
		
		let submitAction = UIAlertAction(title: "Submit", style: .default) {
			[weak self, weak ac] _ in guard let answer = ac?.textFields?[0].text else {return}
			self?.submit(answer.lowercased())
		}
		
		ac.addAction(submitAction)
		present(ac, animated: true)
	}
	
	func submit(_ answer: String) {
		let lowerAnswer = answer.lowercased()
		
		let errorTitle: String
		let errorMessage: String
		
		if answer.count < 3 {
			errorTitle = "Word is too short"
			errorMessage = "Must be 3 characters or longer"
			showErrorMessage(title: errorTitle, message: errorMessage)
			return
		}
		if answer == title {
			errorTitle = "You entered is the original word"
			errorMessage = "Sloppy work Roscoe"
			showErrorMessage(title: errorTitle, message: errorMessage)
			return
		}
		
		if isPossible(word: lowerAnswer) {
			if isOriginal(word: lowerAnswer) {
				if isReal(word: lowerAnswer) {
					usedWords.insert(answer, at: 0)
					let indexPath = IndexPath(row: 0, section: 0)
					tableView.insertRows(at: [indexPath], with: .automatic)
					return
				} else {
					errorTitle = "Word Not Recognized"
					errorMessage = "You make things up ya' know"
					showErrorMessage(title: errorTitle, message: errorMessage)
				}
			} else {
				errorTitle = "Word is already used"
				errorMessage = "Be more original"
				showErrorMessage(title: errorTitle, message: errorMessage)
			}
		} else {
			errorTitle = "Word not possible"
			errorMessage = "You cannot spell that word from \"\(title!.lowercased())\""
			showErrorMessage(title: errorTitle, message: errorMessage)
		}
	}
	
	func isPossible(word: String) -> Bool {
		guard var tempWord = title?.lowercased() else { return false }
		for letter in word {
			if let possition = tempWord.firstIndex(of: letter) {
				tempWord.remove(at: possition)
			} else {
				return false
			}
		}
		return true
	}
	
	func isOriginal(word: String) -> Bool {
		// an alternative idea: use contains() with a Predicate to preserve case??
		return !usedWords.contains(word)
	}
	
	func isReal(word: String) -> Bool {
		let checker = UITextChecker()
		let range = NSRange(location: 0, length: word.utf16.count)
		let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
		print(misspelledRange.location)
		return misspelledRange.location == NSNotFound
	}
	
	func showErrorMessage(title: String, message: String) {
		let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}
}
