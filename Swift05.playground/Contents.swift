import UIKit

var word = "hello"
var drow = ""
var i: Int = 0
for i in word {
    drow = "\(i)" + drow
}
if drow == word {
    print("true")
} else {
    print("false")
}

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for char in puzzleInput {
    if charToRemove.contains(char) {
        continue
    }
    puzzleOutput.append(char)
}
print(puzzleOutput)

let numberSymbol: Character = "5"
var possibleInt: Int?
switch numberSymbol {
case "1":
    possibleInt = 1
case "2":
    possibleInt = 2
case "3":
    possibleInt = 3
case "4":
    possibleInt = 4
default:
    break
}
if let intValue = possibleInt {
    print("Integer value of \(numberSymbol) is \(intValue)")
} else {
    print("Integer value could not be found for \(numberSymbol)")
}

let intToDescribe = 5
var description = "The number \(intToDescribe) is"
switch intToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number and also"
    fallthrough
default:
    description += " an integer"
}
print(description)

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

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}
print("Game over")

