import UIKit

var str = "Hello, playground"

func printHelp() {
	let message = """
Welcome to MyApp!

Run this app in a directory of images and
MyApp will resize them all to thumbnails
"""
	
	print(message)
}

printHelp()

//func square(number: Int) {
//	print(number * number)
//}
//
//square(number: 8)

//func square(number: Int) -> Int {
//	return number * number
//}
//
//let result = square(number: 8)
//print(result)

func sayHello(to name: String) {
	print("Hello, \(name)")
}

sayHello(to: "Taylor")

//func greet(_ person: String) {
//	print("Hello, \(person)")
//}
//
//greet("Taylor")

func greet(_ person: String, nicely: Bool = true) {
	if nicely == true {
		print("Hello, \(person)")
	} else {
		print("Oh no, its \(person) again...")
	}
}

greet("Taylor")
greet("Taylor", nicely: false)


print("Haters", "gonna", "hate")


func square(numbers: Int...) {
	for number in numbers {
		print("\(number) squared is \(number * number)")
	}
}

square(numbers: 1,2,3,4,5)
square(numbers: )


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
	print("That password is good")
} catch {
	print("You cannot use that password")
}


func doubleInPlace(number: inout Int) {
	number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)

myNum
