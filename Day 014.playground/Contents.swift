import UIKit

var str = "Hello, playground"

func favouriteAlbum(name: String) {
	print("My favourite album is \(name).")
}

favouriteAlbum(name: "Fearless")

func printAlbumRelease(name: String, year: Int) {
	print("\(name) was released in \(year)")
}

printAlbumRelease(name: "Fearless", year: 2008)
printAlbumRelease(name: "Speak Now", year: 2010)

func countLettersInString(in str: String) {
	print("The string: \(str) has \(str.count) letters")
}

countLettersInString(in: "Hello")

func albumIsTaylor(name: String) -> Bool {
	switch name {
	case "Taylor Swift":
		return true
	case "Fearless":
		return true
	case "Speak Now":
		return true
	case "Red":
		return true
	case "1989":
		return true
	default:
		return false
	}
}

if albumIsTaylor(name: "Red") {
	print("That's one of hers!")
} else {
	print("Who made that?!")
}

//func getHaterStatus() -> String {
//	return "Hate"
//}
//
//func getHaterStatus(weather: String) -> String? {
//	if weather == "sunny" {
//		return nil
//	} else {
//		return "Hate"
//	}
//}

var status: String?
//status = getHaterStatus(weather: "rainy")

func takeHaterAction(status: String) {
	if status == "Hate" {
		print("Hating")
	}
}

//if let haterStatus = getHaterStatus(weather: "rainy") {
//	takeHaterAction(status: haterStatus)
//}

func yearAlbumReleased(name: String) -> Int? {
	switch name {
	case "Taylor Swift":
		return 2006
	case "Fearless":
		return 2008
	case "Speak Now":
		return 2010
	case "Red":
		return 2012
	case "1989":
		return 2014
	default:
		return nil
	}
}

let album2 = "Red"
var year = yearAlbumReleased(name: album2)
if year == nil {
	print("\(album2) is not one of her albums")
} else {
	print("It was released in \(year!)")
}

func albumReleased(year: Int) -> String? {
	switch year {
	case 2006: return "Taylor Swift"
	case 2008: return "Fearless"
	case 2010: return "Speak Now"
	case 2012: return "Red"
	case 2014: return "1989"
	default: return nil
	}
}

let album = albumReleased(year: 2004) ?? "unknown"
print("The album is \(album)")


func getHaterStatus(weather: String) -> String? {
	if weather == "sunny" {
		return nil
	} else {
		return "Hate"
	}
}
enum WeatherType {
	case sun
	case cloud
	case rain
	case wind(speed: Int)
	case snow
}


func getHaterStatus(weather: WeatherType) -> String? {
	switch weather {
	case .sun:
		return nil
	case .wind(let speed) where speed < 10:
		return "meh"
	case .cloud, .wind:
		return "dislike"
	default:
		return "hate"
	}
}

getHaterStatus(weather: WeatherType.wind(speed: 9))

//struct Person {
//	var clothes: String
//	var shoes: String
//}
//
//let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
//let other = Person(clothes: "short skirts", shoes: "high heels")
//
//print(taylor.clothes)
//print(other.shoes)
//
//var taylorCopy = taylor
//taylorCopy.shoes = "flip flops"
//
//print(taylor)
//print(taylorCopy)

//struct Person {
//	var clothes: String
//	var shoes: String
//
//	func describe() {
//		print("I like wearing \(clothes) with \(shoes)")
//	}
//}
//
//let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
//let other = Person(clothes: "short skirts", shoes: "high heels")
//
//print(taylor.clothes)
//print(other.shoes)
//
//print(taylor.describe())

class Person {
	var clothes: String
	var shoes: String
	
	init(clothes: String, shoes: String) {
		self.clothes = clothes
		self.shoes = shoes
	}
	func sing() {
		print("La la la la")
	}
}

class Singer {
	var name: String
	var age: Int
	
	init(name: String, age: Int) {
		self.name = name
		self.age = age
	}
	
	func sing() {
		print("La la la la")
	}
}
//var taylor = Singer(name: "Taylor", age: 25)
//taylor.name
//taylor.age
//taylor.sing()

class CountrySinger: Singer {
	override func sing() {
		print("Trucks, guitars, and liquor")
	}
}

var taylor = CountrySinger(name: "Taylor", age: 25)
taylor.age
taylor.sing()

class HeavyMetalSinger: Singer {
	var noiseLevel: Int
	
	init(name: String, age: Int, noiseLevel: Int) {
		self.noiseLevel = noiseLevel
		super.init(name: name, age: age)
	}
	
	override func sing() {
		print("Grrrrr rargh rargh rarrrrgh!")
	}
}

var eddie = HeavyMetalSinger(name: "Eddie Van Hallen", age: 182, noiseLevel: 99)

eddie.noiseLevel
