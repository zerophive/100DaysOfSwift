import UIKit

var str = "Hello, playground"

//protocol Identifiable {
//	var id: String {get set}
//}
//
//struct User: Identifiable {
//	var id: String
//}
//
//func displayID(thing: Identifiable) {
//	print("My ID is \(thing.id)")
//}
//
//var item = User(id: "Bff")
//
//print(item.id)
//
//displayID(thing: item)

protocol Payable {
	func calculateWages() -> Int
}

protocol NeedsTraining {
	func study()
}

protocol HasVacation {
	func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

class Worker: Employee {
	var vacationDays = 10
	var level = 5
	var name: String
	
	init(name: String) {
		self.name = name
	}
	
	func calculateWages() -> Int {
		return level * 10_000
	}
	
	func study() {
		print("\(name) is studying")
		level -= 1
		print("new level: \(level)")
	}
	
	func takeVacation(days: Int) {
		print("\(name) is taking \(days) day(s) vacation")
		vacationDays -= days
	}
}

var emp = Worker(name: "Fred")
print("\(emp.name)")

emp.study()
emp.level

extension Int {
	func squared() -> Int {
		return self * self
	}
}

let number = 8

number.squared()

extension Int {
	var isEven: Bool {
		return self % 2 == 0
	}
}

number.isEven

var foo = "foo"

extension String {
	func append(_ other: String) -> String {
		return self + other
	}
}

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
	func summarize() {
		print("There are \(count) of us: ")
		
		for name in self {
			print(name)
		}
	}
}

print(beatles.summarize())

protocol SuperHeroMovie {
	func writeScript() -> String
}
extension SuperHeroMovie {
	func makeScript() -> String {
		return """
		Lots of special effects,
		some half-baked jokes,
		and a hint of another
		sequel at the end.
		"""
	}
}

struct Bff: SuperHeroMovie {
	func writeScript() -> String {
		return "Mff"
	}
}

var Nnn = Bff()

Nnn.makeScript()


protocol Identifiable {
	var id: String { get set }
	func identify()
}

extension Identifiable {
	func identify() {
		print("My ID is \(id)")
	}
}

struct User: Identifiable {
	var id: String
}

let twostraws = User(id: "twostrays")
twostraws.identify()
