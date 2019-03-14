import UIKit

var str = "Hello, playground"

let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore
let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore

let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let actions = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

let res = ["North", "South"]

var score = 95
score -= 5

var quote = "The rain in Spain mainly falls on the "
quote += "Spainards"

firstScore == secondScore
firstScore != secondScore
firstScore < secondScore
firstScore >= secondScore

"Taylor" <= "Swift"

let firstCard = 11
let secondCard = 10
if firstCard + secondCard == 2 {
	print("Aces - lucky!!")
} else if firstCard + secondCard == 21 {
	print("Blackjack!")
} else {
	print("Regular cards")
}

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
	print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
	print("One of them is over 18")
}

print(firstCard == secondCard ? "Cards are the same" : "Card are different")


let weather = "sunny"

switch weather {
case "rain":
	print("Bring an umbrella")
case "snow":
	print("Wrap up warm")
case "sunny":
	print("Wear sunscreen")
	fallthrough
default:
	print("Enjoy your day")
}

let score2 = 85

switch score2 {
case 0..<50:
	print("You failed badly.")
case 50..<85:
	print("You did OK.")
default:
	print("You did great!")
}

let numberOfCats = 1
switch numberOfCats {
case 0:
	print("You have no cats")
case 1...3:
	print("You have some cats")
case 4..<10:
	print("You have many cats!")
default:
	print("OK cat lady")
}

let passingGrade = 70...100

passingGrade
