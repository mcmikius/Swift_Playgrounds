import UIKit


func makeList(_ n: Int) -> [Int] {
    return (0..<n).map{ _ in Int(arc4random_uniform(100) + 1) }
}
let list = makeList(100).sorted()
print(list)

func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

func printHelloWorld() {
    print("Hello World!")
}

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Resilt - \(mathFunction(2, 3))")

func greetTwo(person: String) {
    print("Hello \(person)")
}

greetTwo(person: "Dave")

func printAnCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAnCount(string: string)
}

printAnCount(string: "Hello World")
printWithoutCounting(string: "Hello world")

var completionHandlers: [() -> Void] = []
func someFuncWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFuncWithoutEscapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFuncWithEscapingClosure {
            self.x = 100
        }
        someFuncWithoutEscapingClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }
    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }
    return backward ? stepBackward : stepForward
}

var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
print("Counting to zero...")
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("ZERO!")


func sayHelloWorld() -> String {
    return "Hello world!"
}
print(sayHelloWorld())

func greetAgain(person: String) -> String {
    let greeting = "Hello again, \(person)!"
    return greeting
}
func greetThree(person: String) -> String {
    let greeting = "Hello \(person)"
    return greeting
}
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greetThree(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: false))

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
let customerProvider = {
    customersInLine.remove(at: 0)
}
print(customersInLine.count)
print("Now serving \(customerProvider())!")
print(customersInLine.count)

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
print(customersInLine.count)

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
print(customersInLine.count)

var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
reversedNames = names.sorted(by: { s1, s2 in
    return s1 > s2
})
reversedNames = names.sorted(by: { $0 > $1 })
reversedNames = names.sorted(by: > )
print(reversedNames)

let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let numbers = [18, 63, 345]
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
print(strings)

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    } else {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
}

if let bounds = minMax(array: [8, -4, 0, 3, 8, 9]) {
    print("Min = \(bounds.min); Max = \(bounds.max)")
} else {
    print("Array is empty")
}

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}
print(greet(person: "Steve", from: "San Francisco"))

func greatPerson(_ person: String) -> String {
    let greeting = "Hello \(person)"
    return greeting
}
print(greatPerson("Alex"))

func multiply(a: Int, b: Int = 5) -> Int {
    return a * b
}
multiply(a: 5, b: 6)
multiply(a: 3)

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print(someInt, anotherInt)
