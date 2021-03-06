//
//  ViewController.swift
//  Project1
//
//  Created by oaccamsrazor on 4.3.2019.
//  Copyright © 2019 oaccamsrazor All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	var pictures = [String]()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Storm Viewer"
		navigationController?.navigationBar.prefersLargeTitles = true
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(promoteApp))

		let fm = FileManager.default
		let path = Bundle.main.resourcePath!
		let items = try! fm.contentsOfDirectory(atPath: path)
		
		for item in items {
			if item.hasPrefix("nssl") {
				pictures.append(item)
			}
		}
		
		pictures.sort()
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
			vc.selectedImage =  pictures[indexPath.row]
			vc.imageCount = pictures.count
			vc.imageIndex = indexPath.row + 1
			navigationController?.pushViewController(vc, animated: true)
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pictures.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
		cell.textLabel?.text = pictures[indexPath.row]
		return cell
	}
	
	@objc func promoteApp() {
		let promotion = "Hey, I love this new App! You should download Project1 today, it is F R E E !!"
		let vc = UIActivityViewController(activityItems: [promotion], applicationActivities: [])
		vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
		present(vc, animated: true)
	}
}

