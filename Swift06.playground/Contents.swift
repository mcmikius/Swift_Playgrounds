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
