import Foundation

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt = \(someInt); anotherInt = \(anotherInt)")

func swapTwoString(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someNewInt = 3
var anotherNewInt = 107
swapTwoValues(&someNewInt, &anotherNewInt)
print("someInt = \(someNewInt); anotherInt = \(anotherNewInt)")
