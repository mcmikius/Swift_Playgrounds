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
