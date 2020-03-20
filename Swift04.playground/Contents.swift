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
