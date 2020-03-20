import UIKit

let names = ["Anna", "Alex", "Brain", "Jack"]
for name in names {
    print("Hello\(name)")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName) is have \(legCount) legs")
}

for index in 1...5 {
    print("\(index) multiply to 5 equel \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print(answer)

let minutes = 60
for tickMark in 0..<minutes {
    print(tickMark)
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    print(tickMark)
}

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[3] = 8
board[6] = 11
board[9] = 9
board[10] = 2
board[14] = -10
board[19] = -11
board[22] = -2
board[24] = -8

var square = 0
var diceRoll = 0

while square < finalSquare {
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
    print("square - \(square)")
}
print("Game over")

square = 0
diceRoll = 0

repeat {
    square += board[square]
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
    print("square - \(square)")
} while square < finalSquare
print("Game over")

let someChar: Character = "b"

switch someChar {
case "a":
    print("It is first char")
case "z":
    print("It is end char")
default:
    print("It is some char")
}
