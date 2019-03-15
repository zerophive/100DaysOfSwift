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
        let cell = tableView.dequeueReusableCell(withIdentifier: "words", for: indexPath)
		cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }

	func startGame() {
		title = allWords.randomElement()
		usedWords.removeAll(keepingCapacity: true)
		tableView.reloadData()
	}
	
	@objc func promptForAnswer() {
		let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
		ac.addTextField()
		
		let submitAction = UIAlertAction(title: "Submit", style: .default) {
			[weak self, weak ac] _ in guard let answer = ac?.textFields?[0].text else {return}
			self?.submit(answer)
		}
		
		ac.addAction(submitAction)
		present(ac, animated: true)
	}
	
	func submit(_ answer: String) {
	}
}
