import UIKit
import Foundation

let numbers = ["a" : 1, "A" : 1, "b" : 2, "B" : 2, "c" : 3, "C" : 3, "d" : 4, "D" : 4, "e" : 5, "E" : 5, "f" : 6, "F" : 6, "g" : 7, "G" : 7, "h" : 8, "H" : 8, "i" : 9, "I" : 9, "j" : 10, "J" : 10, "k" : 11, "K" : 11, "l" : 12, "L" : 12, "m" : 13, "M" : 13, "n" : 14, "N" : 14, "o" : 15,  "O" : 15, "p" : 16, "P" : 16, "q" : 17, "Q" : 17, "r" : 18, "R" : 18, "s" : 19, "S" : 19, "t" : 20, "T" : 20, "u" : 21, "U" : 21, "v" : 22, "V" : 22, "w" : 23, "W" : 23, "x" : 24, "X" : 24, "y" : 25, "Y" : 25, "z" : 26, "Z" : 26]
print("j = ", numbers["y"]!)
print("j force unwrapped: ", numbers["j"]!)
if let myValue = numbers ["r"] {
    print("myValue = ", myValue)
} else {
    print("No value")
}
let name = "Jesse"
for character in name {
    print(character)
}
let x = name.map { character in
    print(character)
}
let chars = "Jesse".map{String($0)}
print("chars", chars)
print("s = ", chars[2])
let keys = (numbers as NSDictionary).allKeys(for: 1)
if keys.count > 0 {
    print("Keys for 1: ", keys)
} else {
    "No key for value"
}
var total = 0

for eachKey in chars {
    if numbers[eachKey] != nil {
        print("Looked-up key value for ", eachKey, numbers[eachKey]!)
        total += numbers[eachKey]!
    }
}
print("Total: ", total)

var intArray:[Int]
intArray = [Int]()
print("\(intArray)")
var intArrayTwo = [Int]()
print("\(intArrayTwo)")
var intArrayThree:[Int] = [2, 3, 5, 7, 11]
print("\(intArrayThree)")
