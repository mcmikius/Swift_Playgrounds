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

func factorial(n: Int) -> Int {
    return n == 0 || n == 1 ? 1 : n * factorial(n: n - 1)
}

print(factorial(n: 5))


