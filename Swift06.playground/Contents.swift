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
