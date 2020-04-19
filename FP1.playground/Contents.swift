import Foundation

//func choosePlusMinus(isPlus: Bool) -> (Int, Int) -> Int {
//    func plus(a: Int, b: Int) -> Int {
//        return a + b
//    }
//    func minus(a: Int, b: Int) -> Int {
//        return a - b
//    }
//    return isPlus ? plus : minus
//}
//
//func extractFullName(firstName: String, lastName: String) -> String {
//    return "\(firstName) \(lastName)"
//}
//func explicityRetunClosure(firstName: String) -> (String) -> String {
//    return {
//        (lastName: String) -> String in
//        return "\(firstName) \(lastName)"
//    }
//}
//let fnIncludingFirstName = explicityRetunClosure(firstName: "John")
//let extractedFullName = fnIncludingFirstName("Doe")

//func factorial(n: Int) -> Int {
//    return n == 0 || n == 1 ? 1 : n * factorial(n: n - 1)
//}
//
//print(factorial(n: 5))

func powerOfTwo(n: Int) -> Int {
    return n == 0 ? 1 : 2 * powerOfTwo(n: n - 1)
}

let fnResult = powerOfTwo(n: 3)

//func power2(n: Int) -> Int {
//    var y = 1
//    for _ in 0...n - 1 {
//        y *= 2
//    }
//    return y
//}

//let result = power2(n: 4)

func repateString(str: String, n: Int) -> String {
    return n == 0 ? "" : str + repateString(str: str , n: n - 1)
}

print(repateString(str: "Hello", n: 4))

func factorial(n: Int, currentFactorial: Int = 1) -> Int {
    return n == 0 ? currentFactorial : factorial(n: n - 1, currentFactorial: currentFactorial * n)
}

print(factorial(n: 3))

var memo = Dictionary<Int, Int>()
func memoizedPower2(n: Int) -> Int {
    if let memoizedResult = memo[n] {
        return memoizedResult
    }
    var y = 1
    for _ in 0...n-1 {
        y *= 2
        
    }
    memo[n] = y
    return y
}

print(memoizedPower2(n: 2))
print(memoizedPower2(n: 3))
print(memoizedPower2(n: 4))
print(memo)

func memoize<T: Hashable, U>(fn: @escaping ((T) -> U, T) -> U) -> (T) -> U {
    var memo = Dictionary<T, U>()
    var result: ((T) -> U)!
    result = {
        x in
        if let q = memo[x] { return q }
        let r = fn(result, x)
        memo[x] = r
        return r
    }
    return result
}

let factorial = memoize { factorial, x in
    x == 0 ? 1 : x * factorial(x - 1)
}

print(factorial(5))
print(factorial(5))
print(factorial(6))

let powerOf2 = memoize { (pow2, x) in
    x == 0 ? 1 : 2 * pow2(x - 1)
}
print(powerOf2(5))

struct OurStruct {
    var data: Int = 3
}

var valueA = OurStruct()
var valueB = valueA
valueA.data = 5
print("\(valueA.data), \(valueB.data)")

class OurClass {
    var data: Int = 3
}

var referenceA = OurClass()
var referenceB = referenceA
referenceA.data = 5
print("\(referenceA.data), \(referenceB.data)")

class User {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let julie = User(name: "Julie")

struct Student {
    var user: User
}

let student = Student(user: julie)
student.user.name
let anotherStudent = student
julie.name = "Julie Jr."
anotherStudent.user.name

let juliya = User(name: "Juliya")
let steve = User(name: "Steve")
let alain = User(name: "Alain")
let users = [alain, julie, steve]

let copyOfUsers = users
users[0].name = "Jean-Marc"
print(users[0].name)
print(copyOfUsers[0].name)

class Manager: NSObject, NSCopying {
    var firstName: String
    var lastName: String
    var age: Int

    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }

    func copy(with: NSZone? = nil) -> Any {
        let copy = Manager(firstName: firstName, lastName: lastName,
        age: age)
        return copy
    }
}

let john = Manager(firstName: "John", lastName: "Doe", age: 35)
let jane = john.copy() as! Manager
jane.firstName = "Jane"
jane.lastName = "Doe"
jane.age = 40
print("\(john.firstName) \(john.lastName) is \(john.age)")
print("\(jane.firstName) \(jane.lastName) is \(jane.age)")
