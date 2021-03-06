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

let yearsOld = 16

switch yearsOld {
case 0..<7:
    print("Child")
case 7..<17:
    print("School")
case 17..<22:
    print("Student")
default:
    print("Worker")
}

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) - 0")
case (_, 0):
    print("\(somePoint) - x")
case (0, _):
    print("\(somePoint) - y")
case (-2...2, -2...2):
    print("\(somePoint) - in area")
default:
    print("\(somePoint) - inout area")
}

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("On X x value = \(x)")
case (0, let y):
    print("On Y y value = \(y)")
case let (x, y):
    print("x value = \(x) y value = \(y)")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("\(x), \(y) on line x = y")
case let (x, y) where x == -y:
    print("\(x), \(y) on line x = -y")
case let (x, y):
    print("x value = \(x) y value = \(y)")
}

let someCharacter: Character = "e"
switch someCharacter {
case "e", "a", "i", "o", "u":
    print("first")
case "b", "c", "d", "f", "g":
    print("second")
default:
    print("it is no char")
}

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On some axes from distance - \(distance)")
default:
    print("Some where")
}


var yrg = 0.0
var yr = 10.0
var kl = 1
yrg = yr
while yrg < 2 * yr {
    yrg = yrg + 0.05 * yrg
    kl = kl + 1
}
print("\(kl)")


let max = 100


var testValue = 2

let startTime = Date()
var data = (2...max).map{$0}
let allocationTime = Date()


while (testValue * testValue <= max) {
    data.removeAll(where: {$0 >= testValue * testValue && $0.isMultiple(of: testValue)})
    testValue = data.first(where: {$0 > testValue})!
}
let overallTime = Date()


print("Всего \(data.count) простых чисел: ", data)
print()
print("Выделение массива: \(String(format: "%.2f",(allocationTime.timeIntervalSince(startTime)))) с. ")
print("Вычисления: \(String(format: "%.2f",(overallTime.timeIntervalSince(allocationTime)))) с. ")
print("Всего: \(String(format: "%.2f",(overallTime.timeIntervalSince(startTime)))) с. ")
