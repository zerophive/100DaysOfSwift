import UIKit

class Singer {
	func playSong() {
		print("Shake it off!")
	}
}
func sing() -> () -> Void {
	let taylor = Singer()
	let adele = Singer()
	
	let singing = { [unowned taylor, unowned adele] in
		taylor.playSong()
		adele.playSong()
		return
	}
	
	return singing
}

let singFunction = sing()
//singFunction()

class House {
	var ownerDetails: (() -> Void)?
	
	func printDetails() {
		print("This is a great house.")
	}
	
	deinit {
		print("I'm being demolished!")
	}
}

class Owner {
	var houseDetails: (() -> Void)?
	
	func printDetails() {
		print("I own a house.")
	}
	
	deinit {
		print("I'm dying!")
	}
}


print("Creating a house and an owner")

do {
	let house = House()
	let owner = Owner()
	house.ownerDetails = { [weak owner] in owner?.printDetails() }
	owner.houseDetails = { [weak house] in house?.printDetails() }
}

print("Done")

