//
//  Person.swift
//  Project10
//
//  Created by oaccamsrazor on 1.4.2019.
//  Copyright © 2019 oaccamsrazor. All rights reserved.
//

import UIKit

class Person: NSObject {
	var name: String
	var image: String
	
	init(name: String, image: String) {
		self.name = name
		self.image = image
	}
}
