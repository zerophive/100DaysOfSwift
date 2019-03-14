import UIKit

var str = "Hello, playground"

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo  = "Ringo Star"

let beatles = [john, paul, george, ringo]

beatles[3]

let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "blue"])

var name = (first: "Taylor", last: "Swift")

name.last

name.first = "Justin"

let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")

address.house

let set = Set(["aardvark", "astronaut", "azalea"])

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

let heights = ["Taylor Swift": 1.78, "Ed Sheeran": 1.73]

heights["Taylor Swift"]

let favouriteIceCream = ["Paul": "Chocolate", "Sophie": "Vanilla"]

favouriteIceCream["Paul"]

favouriteIceCream["Charlotte"]

favouriteIceCream["Charlotte", default: "Unknown"]

var teams = [String: String]()
teams["Paul"] = "Red"
teams

//var result = [Int]()

var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String,Int>()
//var results = Array<Int>()


let result = "failure"
let result2 = "failed"
let result3 = "fail"

enum Results {
	case success
	case failure
}

let result4 = Results.failure

Results.success

enum Activity {
	case bored
	case running(destination: String)
	case talking(topic: String)
	case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")

talking

enum Planet: Int {
	case murcury = 1
	case venus
	case earth
	case mars
}

let earth = Planet(rawValue: 3)

let foo = (1,1,2,2,3,3,4,4,5,5)

foo
