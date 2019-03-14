import UIKit

var str = "Hello, playground"

var name: String = "Tim McGraw"

var age: Int
age = 25

var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333

//var stayOutTooLate: Bool
//stayOutTooLate = true

var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 10

var aa = 1.1
var bb = 2.2
var c = aa + bb

var name1 = "Tim McGraw"
var name2 = "Romeo"
var both = name1 + " and " + name2

name1 < name2
c > 3
c >= 3
c > 4
c < 4

name1 == "Tim McGraw"
name2 != "TIM McGraw"

"Your name \(name)"

"Your name is " + name1

"You are age \(age). In the future you will be \(age * 2)"

var evenNumber = [2, 4, 6, 8]
evenNumber[0]

var songs: [Any] = ["Shake it off", "You belong to me", "Back to December", 3]
songs[0]
songs[1]
songs[3]
type(of: songs)

var songs2 = [String]()
songs2.append("Shake it Off")

var songs3 = ["Shake it Off", "You Belong with Me", "Love Story"]
var songs4 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
var both2 = songs3 + songs4

//var person = [
//				"first": "Taylor",
//				"middle": "Alison",
//				"last": "Swift",
//				"month": "December",
//				"website": "taylorswift.com"]
//person["middle"]
//person["month"]
//

//var action: String
//var person = "dsf"
//
//if person == "hater" {
//	action = "hate"
//} else if person == "player" {
//	action = "play"
//} else {
//	action = "cruise"
//}
//

var action: String
var stayOutTooLate = false
var nothingInBrain = true

if !stayOutTooLate && nothingInBrain {
	action = "cruise"
}

for i in 1...10 {
	print("\(i) x 10 is \(i * 10)")
}

var strg = "Fakers gonna"

for _ in 1...5 {
	strg += " fake"
}

print(strg)

var songs5 = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs5 {
	print("My favorite song is \(song)")
}

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0 ..< people.count {
	var str = "\(people[i]) gonna"
	
	for _ in 1 ... 5 {
		str += " \(actions[i])"
	}
	
	print(str)
}

var counter = 0

while true {
	print("Counter is now \(counter)")
	counter += 1
	
	if counter == 556 {
		break
	}
}

var songs6 = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs6 {
	if song == "You Belong with Me" {
		continue
	}
	
	print("My favorite song is \(song)")
}

let liveAlbums = 2

switch liveAlbums {
case 0:
	print("You are just starting off")

case 1:
	print("You just released iTunes Live from SoHo")
	
case 2:
	print("You just released Speak Now World Tour")
	
default:
	print("HAve you done something new?")
}

let studioAlbums = 5

switch studioAlbums {
case 0...1:
	print("You're just starting out")
	
case 2...3:
	print("You're a rising star")
	
case 4...5:
	print("You're world famous!")
	
default:
	print("Have you done something new?")
}
