//
//  TableViewController.swift
//  Milestone Project 4-6
//
//  Created by oaccamsrazor on 19.3.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
	var groceryList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.allowsMultipleSelectionDuringEditing = false
		
		let addItemButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addGroceryItem))
		let shareListButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareList))

		self.navigationItem.rightBarButtonItems = [addItemButton, shareListButton]
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "clear", style: .plain, target: self, action: #selector(clearGroceryList))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groceryList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
		cell.textLabel?.text = groceryList[indexPath.row]
        return cell
    }

	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			groceryList.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
	}
	
	@objc func addGroceryItem() {
		let ac = UIAlertController(title: "Add a grocery item", message: nil, preferredStyle: .alert)
		ac.addTextField()
		
		let addItem = UIAlertAction(title: "Add", style: .default) {
			[weak self, weak ac] _ in guard let theItem = ac?.textFields?[0].text else { return }
			self?.addItem(theItem.lowercased())
		}
		ac.addAction(addItem)
		present(ac, animated: true)
	}
	
	@objc func clearGroceryList() {
		let ac = UIAlertController(title: "Erase your grocery list?", message: nil, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "Yes", style: .destructive) { _ in
			self.groceryList.removeAll()
			self.tableView.reloadData()
		})
		ac.addAction(UIAlertAction(title: "Nein", style: .default))
		present(ac, animated: true)
	}
	
	@objc func shareList() {
		let groceries = groceryList.joined(separator: "\n")
		let vc = UIActivityViewController(activityItems: [groceries], applicationActivities: nil)
		vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
		present(vc, animated: true)
	}

	func addItem(_ item: String) {
		if groceryList.contains(item) {
			showErrorMessage(title: "Already entered this item", message: nil)
		} else {
			groceryList.insert(item, at: 0)
			let indexPath = IndexPath(row: 0, section: 0)
			tableView.insertRows(at: [indexPath], with: .automatic)
		}
	}
	
	func showErrorMessage(title: String, message: String?) {
		let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}
}
