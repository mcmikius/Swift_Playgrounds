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
