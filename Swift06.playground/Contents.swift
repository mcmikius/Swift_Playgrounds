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
