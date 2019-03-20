//
//  TableViewController.swift
//  Project7
//
//  Created by oaccamsrazor on 20.3.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
	var petitions = [Petition]()
	var filteredPetitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "credtis", style: .plain, target: self, action: #selector(aboutCredits))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "filter", style: .plain, target: self, action: #selector(filterPetitions))
		let urlString: String
		
		if navigationController?.tabBarItem.tag == 0 {
			urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
//			urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
		} else {
			urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
//			urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
		}
		
		if let url = URL(string: urlString) {
			if let data = try? Data(contentsOf: url) {
				parse(json: data)
				return
			}
		}
		showError()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredPetitions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		let petition = filteredPetitions[indexPath.row]
		cell.textLabel?.text = petition.title
		cell.detailTextLabel?.text = petition.body
        return cell
    }

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = DetailViewController()
		vc.detailItem = filteredPetitions[indexPath.row]
		navigationController?.pushViewController(vc, animated: true)
	}

	func parse(json: Data) {
		let decoder = JSONDecoder()
		
		if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
			petitions = jsonPetitions.results
			filteredPetitions = petitions
			tableView.reloadData()
		}
	}

	func showError() {
		let ac = UIAlertController(title: "Error", message: "There was a problem loading the feed, please check your connection and try again.", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}
	
	@objc func aboutCredits() {
		let ac = UIAlertController(title: "Credits", message: "The data is proviced by: We The People API of the Whitehouse", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}
	
	@objc func filterPetitions() {
		let ac = UIAlertController(title: "Filter Petitions", message: nil, preferredStyle: .alert)
		ac.addTextField()
		ac.addAction(UIAlertAction(title: "Add Filter", style: .default) {
			[weak self, weak ac] _ in guard let theFilter = ac?.textFields?[0].text else { return }
			
			var newFilteredPetitions = [Petition]()
			guard let petitions = self?.petitions else {return}
		
			for petition in petitions {
				if petition.title.contains(theFilter) || petition.body.contains(theFilter) {
					newFilteredPetitions.append(petition)
				}
			}
			self?.filteredPetitions = newFilteredPetitions
			self?.tableView.reloadData()
		})
		
		if filteredPetitions.count < petitions.count {
			ac.addAction(UIAlertAction(title: "Clear Filters", style: .destructive) { [weak self] _ in
				guard let petitions = self?.petitions else { return }
				self?.filteredPetitions = petitions
				self?.tableView.reloadData()
			})
		}
		present(ac, animated: true)
	}
}
