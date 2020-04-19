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
