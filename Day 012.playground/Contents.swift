import UIKit

//var str = "Hello, playground"

//var age: Int? = nil
//
//age = 38

var name: String? = nil

if let unwrapped = name {
	print("\(unwrapped.count) letter")
} else {
	print("Missing name")
}

func greet(_ name: String?) {
	guard let unwrapped = name else {
		print("You didn't provide a name")
		return
	}
	
	print("Hello, \(unwrapped)!")
}

greet(nil)

func double(number: Int?) -> Int? {
	guard let number = number else {
		return nil
	}
	return number * 2
}
let input = 5
if let doubled = double(number: input) {
	print("\(input) doubled is \(doubled).")
}

let str = "A5"

let num = Int(str)

let age: Int! = nil

func username(for id: Int) -> String? {
	if id == 1 {
		return "Taylor Swift"
	} else {
		return nil
	}
}

let user = username(for: 15) ?? "Anonymous"

let distanceRan: Double? = 0.5
let distance: Double = distanceRan ?? 0


let names = ["John", "Paul", "George", "Ringo"]


let beatle = names.first?.uppercased()

let credentials = ["twostraws", "fr0sties"]

enum PasswordError: Error {
	case obvious
}

func checkPassword(_ password: String) throws -> Bool {
	if password == "password" {
		throw PasswordError.obvious
	}
	
	return true
}

do {
	try checkPassword("password")
	print("That password is good!")
} catch {
	print("You can't use that password.")
}

if let result = try? checkPassword("password") {
	print("Result was \(result)")
} else {
	print("D'oh!")
}

try! checkPassword("sekrit")
print("OK")

struct Person {
	var id: String
	
	init?(id: String) {
		if id.count == 9 {
			self.id = id
		} else {
			return nil
		}
	}
}

let user3 = Person(id: "HelloTerd")

struct DEFCONRating {
	var number: Int
	init?(number: Int) {
		guard number > 0 else { return nil }
		guard number <= 5 else { return nil }
		self.number = number
	}
}
let defcon = DEFCONRating(number: 6)

var hasForcePowers = "trues"
let convertedHasForcePowers = Bool(hasForcePowers)


var enabled = "false"
let convertedEnabled = Bool(enabled)

class Animal { }
class Fish: Animal { }

class Dog: Animal {
	func makeNoise() {
		print("Woof!")
	}
}


let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
	if let dog = pet as? Dog {
		dog.makeNoise()
	}
}

class Reading {
	var value = 0.0
}
class TemperatureReading: Reading { }
let temperature = TemperatureReading()
if let reading = temperature as? Reading {
	print("The reading is \(reading.value).")
}

class Bird {
	var wingspan: Double? = nil
}
class Eagle: Bird { }
let bird = Eagle()
if let eagle = bird as? Eagle {
	if let wingspan = eagle.wingspan {
		print("The wingspan is \(wingspan).")
	} else {
		print("This bird has an unknown wingspan.")
	}
}

func brewBeer(to strength: Double?) {
	guard let strength = strength else { return }
	print("Let's brew some beer!")
}
brewBeer(to: 5.5)
