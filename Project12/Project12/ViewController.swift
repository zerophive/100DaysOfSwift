//
//  ViewController.swift
//  Project12
//
//  Created by oaccamsrazor on 13.4.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		let defaults = UserDefaults.standard
		
		defaults.set(25, forKey: "Age")
		defaults.set(true, forKey: "UseTouchID")
		defaults.set(CGFloat.pi, forKey: "Pi")
		
		defaults.set("Paul Hudson", forKey: "name")
		defaults.set(Date(), forKey: "LastRun")
		
		let array=["Hello", "World"]
		defaults.set(array, forKey: "SavedArray")
		
		let dict = ["Name": "Paul", "Country": "UK"]
		defaults.set(dict, forKey: "SavedDictionary")
		
		let savedInteger = defaults.integer(forKey: "Age")
		let savedBoolean = defaults.bool(forKey: "UseTouchID")
		
		let savedArray = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()
		let savedDictionary = defaults.object(forKey: "SavedDictionary") as? [String: String] ?? [String: String]()
		
		let savedArray2 = defaults.array(forKey: "SavedArray")
	}


}

