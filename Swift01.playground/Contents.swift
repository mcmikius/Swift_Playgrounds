import UIKit

let maximumNumberAttemps = 10
var currentAttemps = 1

var welcomeMessage = "Hello!"
welcomeMessage = "Hello World!"

print(welcomeMessage)

// It is Comments

/*
 let maximumNumberAttemps = 10
 var currentAttemps = 1
 */

let dog = "John"; print(dog)

let minValueUInt8 = UInt8.min
let maxValueUInt8 = UInt8.max

let minValueInt8 = Int8.min
let maxValueInt8 = Int8.max

let minValueInt64 = Int64.min
let maxValueInt64 = Int64.max

let meaningOfLife = 42
let pi = 3.1459

let anotherPi = 3 + 0.1459

let decimalInt = 17
let binaryInt = 0b10001
let octaInt = 0o21
let hexInt = 0x11

let decimalDouble = 12.1875
let expDouble = 1.21875e1
let hexDouble = 0xC.3p0

let oneMillion = 1_000_000

//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1
let twoThousand: UInt16 = 2000
let one: UInt8 = 1
let twoThousandOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFive = 0.14159
let numberPi = Double(three) + pointOneFourOneFive

typealias AudioSample = UInt16

let maxValue = AudioSample.max

let isHide = true

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("Status code: \(statusCode)")
print("Message: \(statusMessage)")

let (justStatusCode, _) = http404Error
print("Status code: \(justStatusCode)")

print("Status code: \(http404Error.0)")
print("Message: \(http404Error.1)")

let http200Status = (statusCode: 200, description: "Ok")
print("Status code: \(http200Status.statusCode)")
print("Message: \(http200Status.description)")

var temperature = -1
if temperature <= 0 {
    print("very cold")
} else if temperature >= 30 {
    print("very hot")
} else {
    print("normal")
}

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
if convertedNumber != nil {
    print("converted number include some value - \(String(describing: convertedNumber!))")
} else {
    print("converted number include nil")
}
if let actualNumber = convertedNumber {
    print("converted number include some value - \(actualNumber)")
} else {
    print("converted number include nil")
}


if let firstNumber = Int("4"), let secontNumber = Int("42"), firstNumber < secontNumber && secontNumber < 100 {
    print("\(firstNumber) < \(secontNumber) < 100")
}

let possibleString: String? = "Optional string"
let forcedString: String = possibleString!

let assumedString: String!
assumedString = "Implecity string"
let implecityString: String = assumedString

let i = 9 % 4

let newValue = true ? 1 : 0
print(newValue)

let four = 4
let minusFour = -four
var a = 1
a += 2
let x = 1
let y = 2
x == y
x != y
x > y
x < y
x >= y
x <= y

(2, "zebra") < (2, "apple")

let R = 4
if (R % 2) == 0 {
    print("even")
} else {
    print("uneven")
}

let defaultColor = "red"
var userDefinedColor: String?
userDefinedColor = "black"
var colorToUse = userDefinedColor ?? defaultColor
print(colorToUse)

let allowedEntry = false
if !allowedEntry {
    print("Canceled")
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome")
} else {
    print("Denied")
}

let hasDoorKey = false
let adminPassword = true

if hasDoorKey || adminPassword {
    print("Welcome")
} else {
    print("Denied")
}

