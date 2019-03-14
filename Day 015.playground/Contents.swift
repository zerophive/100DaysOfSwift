import UIKit

var str = "Hello, playground"


//struct Person {
//	var clothes: String
//	var shoes: String
//
//	func describe() {
//		print("I like wearing \(clothes) with \(shoes)")
//	}
//}
//
//
//let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
//let other = Person(clothes: "short skirts", shoes: "high heels")
//taylor.describe()
//other.describe()


//
//struct Person {
//	var clothes: String {
//		willSet {
//			print("I'm changing from \(clothes) to \(newValue)")
//		}
//
//		didSet {
//			print("I just changed from \(oldValue) to \(clothes)")
//		}
//	}
//}
//
//func updateUI(msg: String) {
//	print(msg)
//}
//
//
//var taylor = Person(clothes: "T-shirts")
//var other = Person(clothes: "short skirts")
//taylor.clothes = "short skirts"
//other.describe()

struct Person {
	var age: Int
	
	var ageInDogYears: Int {
		get {
			return age * 7
		}
	}
}

//var fan = Person(age: 25)

//fan.ageInDogYears

//struct TaylorFan {
//	static var favouriteSong = "Look What You Made Me Do"
//
//	var name: String
//	var age: Int
//}
//
//let fan = TaylorFan(name: "James", age: 25)
//print(TaylorFan.favouriteSong)


class TaylorFan {
	private var name: String!
}

class Album {
	var name: String
	
	init(name: String) {
		self.name = name
	}
	
	func getPerformance() -> String {
		return "The album \(name) sold lots"
	}
}

class StudioAlbum: Album {
	var studio: String
	
	init(name: String, studio: String) {
		self.studio = studio
		super.init(name: name)
	}
	
	override func getPerformance() -> String {
		return "The studio album \(name) sold lots"
	}
}

class LiveAlbum: Album {
	var location: String
	
	init(name: String, location: String) {
		self.location = location
		super.init(name: name)
	}
	
	override func getPerformance() -> String {
		return "The live album \(name) sold lots"
	}
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

//var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]
var allAlbums: [Album] = [taylorSwift, fearless]

//for album in allAlbums {
//	print(album.getPerformance())
//	if let studioAlbum = album as? StudioAlbum {
//		print(studioAlbum.studio)
//	} else if let liveAlbum = album as? LiveAlbum {
//		print(liveAlbum.location)
//	}
//}

//for album in allAlbums as? [LiveAlbum] ?? [LiveAlbum]() {
//	print(album.location)
//}

let number = 5
let text = String(number)
print(text)

let vw = UIView()

UIView.animate(withDuration: 0.5, animations: {
	vw.alpha = 0
})

func storeTwoValues(value1: String, value2: String) -> (String) -> String {
	var previous = value1
	var current = value2
	return { new in
		let removed = previous
		previous = current
		current = new
		return "Removed \(removed)"
	}
}
let store = storeTwoValues(value1: "Hello", value2: "World")
let removed = store("Value Three")
print(removed)
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
protocol CanFly {
	var maximumFlightSpeed: Int { get set }
}
protocol CanDrive {
	var maximumDrivingSpeed: Int { get set }
}
struct FlyingCar: CanFly, CanDrive {
	var maximumFlightSpeed: Int
	var maximumDrivingSpeed: Int
}
