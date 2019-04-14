//
//  ViewController.swift
//  Project1
//
//  Created by oaccamsrazor on 4.3.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	var pictures = [String]()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Storm Viewer"
		navigationController?.navigationBar.prefersLargeTitles = true
		performSelector(inBackground: #selector(loadImages), with: nil)
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
			let pictureName = pictures[indexPath.row]
			let defaults = UserDefaults.standard
			var pictureCount = defaults.integer(forKey: pictureName)

			vc.selectedImage =  pictureName
			vc.imageCount = pictures.count
			vc.imageIndex = indexPath.row + 1
			
			pictureCount += 1
			defaults.set(pictureCount, forKey: pictureName)
			tableView.reloadRows(at: [indexPath], with: .automatic)
			
			navigationController?.pushViewController(vc, animated: true)
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pictures.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let pictureName = pictures[indexPath.row]
		let defaults = UserDefaults.standard
		let pictureCount = defaults.integer(forKey: pictureName)

		let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
		cell.textLabel?.text = pictureName
		cell.detailTextLabel?.text = "number of times viewed: \(pictureCount)"
		
		return cell
	}
	
	@objc func loadImages() {
		let fm = FileManager.default
		let path = Bundle.main.resourcePath!
		let items = try! fm.contentsOfDirectory(atPath: path)
		
		for item in items {
			if item.hasPrefix("nssl") {
				pictures.append(item)
			}
		}
		
		pictures.sort()
		
		tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
	}
}

