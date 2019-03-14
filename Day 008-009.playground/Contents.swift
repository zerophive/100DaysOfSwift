import UIKit

var str = "Hello, playground"

//struct Sport {
//	var name: String = "Pool"
//	var type: String = "Easy"
//}
//
//var tennis = Sport(name: "Tennis", type: "Hard")
//print(tennis.name)
//
//tennis.name = "Lawn Tennis"
//
//print(tennis.name)
//print(tennis.type)
//
//var pool = Sport()
//
//print(pool.name)

struct Sport {
	var name: String
	var isOlympicSport: Bool
	
	var olympicStatus: String {
		if isOlympicSport {
			return "\(name) is an Olympic Sport"
		} else {
			return "\(name) is not an Olympic Sport"
		}
	}
}

let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)

print(chessBoxing.olympicStatus)

struct Progress {
	var task: String
	var amount: Int {
		didSet {
			print("\(task) is not \(amount)% complete.")
		}
	}
}

var progress = Progress(task: "Loading Data", amount: 0)

progress.amount = 30
progress.amount = 80
progress.amount = 100

struct BankAccount {
	var name: String
	var isMillionnaire = false
	var balance: Int {
		didSet {
			if balance > 1_000_000 {
				isMillionnaire = true
			} else {
				isMillionnaire = false
			}
		}
	}
}

struct City {
	var population: Int
	
	func collectTaxes() -> Int {
		return population * 1000
	}
}

let london = City(population: 9_000_000)
london.collectTaxes()

//struct User {
//	var name: String
//	var street: String
//	var city: String
//	var postalCode: String
//	func printAddress() -> String {
//		return """
//		\(name)
//		\(street)
//		\(city)
//		\(postalCode)
//		"""
//	}
//}


//struct Person {
//	var name: String
//
//	mutating func makeAnonymous() {
//		name = "Anonymous"
//	}
//}
//
//var person = Person(name: "Ed")
//
//person.makeAnonymous()
//print(person.name)
//

struct Delorean {
	var speed = 0
	mutating func accelerate() {
		speed += 1
		if speed == 88 {
			travelThroughTime()
		}
	}
	func travelThroughTime() {
		print("Where we're going we don't need roads.")
	}
}


let string = "Do or do not, there is no try."

print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())
print(string.contains("do"))

let definitelyTrue = "Fox in sox"
definitelyTrue.contains("socks")

let username = "twostraws"
username.uppercased() == "TWOSTRAWS"


var toys = ["Woody"]

print(toys.count)
toys.append("Buzz")
toys.index(of: "Buzz")

print(toys.sorted())

toys

toys.remove(at: 0)

toys


var usedNumbers = [Int]()
for i in 1...10 {
	usedNumbers.append(i)
}
usedNumbers.count > 5

let tens = [30, 20, 10]
tens.sorted() == [10, 20, 30]


struct User {
	var username: String
	
	init() {
		username = "Anonymous"
		print("Creating a new user!")
	}
}

var user = User()

user.username = "twostaws"


struct Wine {
	var grape: String
	var region: String
}
let malbec = Wine(grape: "Malbec", region: "Cahors")

//struct Person {
//	var name: String
//
//	init(name: String) {
//		print("\(name) was born")
//		self.name = name
//	}
//}
//
//let per = Person(name: "bob")
//
//per.name

struct SuperHero {
	var nickname: String
	var powers: [String]
	init(nickname: String, superPowers: [String]) {
		self.nickname = nickname
		self.powers = superPowers
	}
}
let batman = SuperHero(nickname: "The Caped Crusader", superPowers: ["He's really rich"])

struct FamilyTree {
	init() {
		print("Creating family tree")
	}
}

//struct Person {
//	var name: String
//	lazy var familyTree = FamilyTree()
//
//	init(name: String) {
//		self.name = name
//	}
//}

//var ed = Person(name: "Ed")

//ed.familyTree

struct Student {
	static var classSize = 0
	var name: String
	
	init(name: String) {
		self.name = name
		Student.classSize += 1
	}
}

//let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")

print(Student.classSize)

struct Pokemon {
	static var numberCaught = 0
	var name: String
	static func catchPokemon() {
		print("Caught!")
		Pokemon.numberCaught += 1
	}
}

struct Person {
	private var id: String
	
	init(id: String) {
		self.id = id
	}
	
	func identify() -> String {
		return "My social security numbert is \(id)"
	}
}

let ed = Person(id: "12345")
print(ed.identify())

struct Doctor {
	var name: String
	var location: String
	private let currentPatient = "No one"
}
let drJones = Doctor(name: "Esther Jones", location: "Bristol")

struct App {
	var name2: String
	private var sales = 0
	init(name: String) {
		name2 = name
	}
}
let spotify = App(name: "Spotify")

struct Person2 {
	private var socialSecurityNumber: String
	init(ssn: String) {
		socialSecurityNumber = ssn
	}
}
let sarah = Person2(ssn: "555-55-5555")


struct Customer {
	var name: String
	private var creditCardNumber: Int
	init(name: String, creditCard: Int) {
		self.name = name
		self.creditCardNumber = creditCard
	}
}
let lottie = Customer(name: "Lottie Knights", creditCard: 1234567890)




struct Contributor {
	private var name = "Anonymous"
}
let paul = Contributor()

struct School {
	var staffNames: [String]
	private var studentNames: [String]
	init(staff: String...) {
		self.staffNames = staff
		self.studentNames = [String]()
	}
}
let royalHigh = School(staff: "Mrs Hughes")
