import UIKit

var str = "Hello, playground"

let count = 1...10

for number in count {
	print("number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
	print("\(album) is on Apple Music")
}

print("Players gonna ")

for _ in 1...5 {
	print("play")
}

var number = 1

while number <= 20 {
	print(number)
	number += 1
}

print("Ready or not, here I come!")

number = 1

while number <= 20 {
	print(number)
	
	if number == 9 {
		print("exiting")
		break
	}
	number += 1
}

number = 1

repeat {
	print(number)
	number += 1
} while number <= 20

print("Ready or not, here I come!")

while false {
	print("This is false")
}

repeat {
	print("This is false")
} while false


//var doubles = 0
//var value = 1
//while {
//	doubles += 1
//	value *= 2
//	print("Value is \(value)")
//} repeat doubles < 10

outerLoop: for i in 1...10 {
	for j in 1...10 {
		let product = i * j
		print("\(i) * \(j) is \(product)")
		
		if product == 50 {
			print("It's a bullseye!!")
			break outerLoop
		}
	}
}

for i in 1...10 {
	if i % 2 == 1 {
		continue
	}
	print(i)
}

var counter = 0

while true {
	print(" ")
	counter += 1
	
	if counter == 273 {
		break
	}
}
