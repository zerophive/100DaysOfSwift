//
//  Person.swift
//  Project10
//
//  Created by oaccamsrazor on 1.4.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
	var name: String
	var image: String
	
	init(name: String, image: String) {
		self.name = name
		self.image = image
	}
	
	// MARKER: - NSCoding protocol methods
	
	required init?(coder aDecoder: NSCoder) {
		name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
		image = aDecoder.decodeObject(forKey: "image") as? String ?? ""
	}
	
	func encode(with aCoder: NSCoder) {
		aCoder.encode(name, forKey: "name")
		aCoder.encode(image, forKey: "image")
	}
}
