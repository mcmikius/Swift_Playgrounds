import UIKit

var multilineStr = """
Long string

long String
"""
print(multilineStr)

var str = "\'Special\t \"symbols\" \\ \n New line"
print(str)

let dollarSign = "\u{24}"
let heart = "\u{1f496}"
let smile = "😆"

var emptyString = ""
var anotherEmpryString = String()
if emptyString == "" {
    print("empty")
}

if emptyString.isEmpty {
    print("empty")
}

for character in "Fuck you! 🖕" {
    print(character)
}

let exclamationMark: Character = "!"

let carCharacters: [Character] = ["C", "a", "t", "!"]
let carString = String(carCharacters)

let stringOne = "Hello"
let stringTwo = " World!"
print(stringOne + stringTwo)
var welcome = stringOne + stringTwo
welcome += "!"
print(welcome)

welcome.append(exclamationMark)
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message)

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

for index in greeting.indices {
    print(greeting[index], terminator: " ")
}

var welcomeMessage = "hello"
welcomeMessage.insert("!", at: welcomeMessage.endIndex)
welcomeMessage.insert(contentsOf: " there", at: welcomeMessage.index(before: welcomeMessage.endIndex))

welcomeMessage.remove(at: welcomeMessage.index(before: welcomeMessage.endIndex))

let range = welcomeMessage.index(welcomeMessage.endIndex, offsetBy: -6)..<welcomeMessage.endIndex
welcomeMessage.removeSubrange(range)

let greetingTwo = "Hello, world!"
let ind = greetingTwo.firstIndex(of: ",") ?? greetingTwo.endIndex
let beginning = greetingTwo[..<ind]
