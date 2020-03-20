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
