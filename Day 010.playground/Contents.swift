import UIKit

var str = "Hello, playground"

class Dog {
	var name: String
	var breed: String
	
	init(name: String, breed: String) {
		self.name = name
		self.breed = breed
	}
	
	func makeNoise() {
		print("Woof!")
	}
}
let poppy = Dog(name: "Poppy", breed: "Poodle")

print(poppy.name)

class Poodle: Dog {
	init(name: String) {
		super.init(name: name, breed: "Poodle")
	}
	
	override func makeNoise() {
		print("Yip")
	}
}

let luna = Poodle(name: "Luna")
print(luna.name)

luna.makeNoise()

class Exercise {
	func describe() {
	}
}
class ChinUps: Exercise {
	override func describe() {
	}
}
let firstRep = ChinUps()
firstRep.describe()

//class Singer {
//	var name = "Taylor Swift"
//}
//
//var singer = Singer()
//
//print(singer.name)
//
//var singerCopy = singer
//
//singerCopy.name = "Justin Beeber"
//
//print(singer.name)

struct Calculator {
	var currentTotal = 0
}
var baseModel = Calculator()
var casio = baseModel
var texas = baseModel
casio.currentTotal = 556
texas.currentTotal = 384
print(casio.currentTotal)
print(texas.currentTotal)

class Person {
	var name = "John Doe"
	
	init () {
		print("\(name) is alive")
	}
	
	deinit {
		print("\(name) is no more")
	}
	
	func printGreeting() {
		print("Hello, I'm \(name)")
	}
}

for _ in 1...3 {
	let person = Person()
	person.printGreeting()
}

//class Singer {
//	let name = "Taylor Swift"
//}
//
//let taylor = Singer()
//taylor.name = "Ed Sheeran"
//print(taylor.name)

struct Kindergarten {
	var numberOfScreamingKids = 30
	mutating func handOutIceCream() {
		numberOfScreamingKids = 0
	}
}
let kindergarten = Kindergarten()
kindergarten.handOutIceCream()
