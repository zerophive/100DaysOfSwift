import UIKit

var str = "Hello, playground"

//let driving = {
//	print("I'm driving in my car")
//}
//
//driving()

//let driving = { (place: String) in
//	print("I'm driving to \(place) in my car")
//}
//
//driving("London")

//
//let driving = { (place: String) -> String in
//	return "I'm driving to \(place) in my car"
//}
//
//let message = driving("London")
//
//print(message)


//let driving = {
//	print("I'm driving in my car")
//}
//
//func travel(action: () -> Void) {
//	print("I'm getting ready to go.")
//	action()
//	print("I arrived")
//}

//travel(action: driving)

//let driving = {
//	print("I'm driving in my car")
//}
//
//func travel(action: () -> Void) {
//	print("I'm getting ready to go.")
//	action()
//	print("I arrived")
//}
//
//travel {
//	print("I'm driving in my car")
//}
//

func goOnVacation(to destination: String, _ activities: () -> Void) {
	print("Packing bags...")
	print("Getting on plane to \(destination)...")
	activities()
	print("Time to go home!")
}
goOnVacation(to: "Mexico") {
	print("Go sightseeing")
	print("Relax in sun")
	print("Go hiking")
}

func goCamping(then action: () -> Void) {
	print("We're going camping!")
	action()
}
goCamping {
	print("Sing songs")
	print("Put up tent")
	print("Attempt to sleep")
}

//func travel(action: () -> String) {
//	print("I'm getting ready to go.")
//	print(action())
//	print("I arrived")
//}
//
//travel {() -> String in
//	return "I'm going in my car..."
//}

//func travel(action: (String) -> String) {
//	print("I'm getting ready to go.")
//	let msg = action("London")
//	print(msg)
//	print("I arrived")
//}
//
//travel {(place: String) -> String in
//	return "I'm going to \(place) in my car"
//}


func loadData(input: () -> String) {
	print("Loading...")
	let str = input()
	print("Loaded: \(str)")
}
loadData {
	return "He thrusts his fists against the posts"
}

func manipulate(numbers: [Int], using algorithm: (Int) -> Int) {
	for number in numbers {
		let result = algorithm(number)
		print("Manipulating \(number) produced \(result)")
	}
}
manipulate(numbers: [1, 2, 3]) { (number: Int) in
	return number * number
}


//func travel(action: () -> String) {
//	print("I'm getting ready to go.")
//	print(action())
//	print("I arrived")
//}
//
//travel {
//	"I'm going in my car..."
//}

//func travel(action: (String) -> String) {
//	print("I'm getting ready to go.")
//	let msg = action("London")
//	print(msg)
//	print("I arrived")
//}
//
//travel {
//	"I'm going to \($0) in my car"
//}

//func travel(action: (String, Int) -> String) {
//	print("I'm getting ready to go.")
//	let description = action("London", 60)
//	print(description)
//	print("I arrived")
//}
//
//travel {
//	"I'm goign to \($0) at \($1) miles per hour"
//}

//func travel() -> (String) -> Void {
//	return {
//		print("I'm goign to \($0)")
//	}
//}
//
//let result = travel()
//
//result("London")
//
//
//func mealProducer() -> (Int) -> String {
//	return {
//		print("I'll make dinner for \($0) people.")
//	}
//}
//let makeDinner = mealProducer()
//print(makeDinner(5))


func travel() -> (String) -> Void {
	var counter = 1
	return {
		print("\(counter). I'm going to \($0)")
		counter += 1
	}
}

let result = travel()
result("London")
result("London")
result("London")

func visitPlaces() -> (String) -> Void {
	var places = [String: Int]()
	return {
		places[$0, default: 0] += 1
		let timesVisited = places[$0, default: 0]
		print("Number of times I've visited \($0): \(timesVisited).")
	}
}
let visit = visitPlaces()
visit("London")
visit("New York")
visit("London")

func handOutBusinessCards() -> () -> Void {
	let number = 0
	return {
		number += 1
		print("Number handed out: \(number)")
	}
}
let handOut = handOutBusinessCards()
handOut()
handOut()
