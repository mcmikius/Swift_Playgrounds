import UIKit

var someInts = [Int]()
someInts.append(3)
someInts.count
someInts = []
someInts.count
var threeDouble = Array(repeating: 0.0, count: 3)
var anotherThereDouble = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDouble + anotherThereDouble
var shopingList: [String] = ["Eggs", "Milk"]
shopingList.count
shopingList.isEmpty

shopingList.append("Bread")
shopingList += ["Beer"]
shopingList += ["Choco", "Cheese", "Butter"]
shopingList.count
var firstItem = shopingList[0]
shopingList[0] = "Six eggs"
shopingList[4...6] = ["bananas", "apples"]
shopingList.count
shopingList.insert("Sirop", at: 0)
shopingList
let sirop = shopingList.remove(at: 0)
let apples = shopingList.removeLast()
shopingList
for item in shopingList {
    print(item)
}
for (index, value) in shopingList.enumerated() {
    print("\(index + 1). \(value)")
}
var favoriteGenres: Set<String> = ["Rock", "Classical"]
favoriteGenres.insert("Hip hop")
favoriteGenres.count

favoriteGenres.isEmpty
favoriteGenres.insert("Jazz")
if let removedGenre = favoriteGenres.remove("Rock") {
    print("Deleted \(removedGenre)")
} else {
    print("Element is not exist")
}
favoriteGenres.insert("Rock")
for genre in favoriteGenres {
    print(genre)
}
if favoriteGenres.contains("Funk") {
    print("Exist")
} else {
    print("Not exist")
}

for genre in favoriteGenres.sorted() {
    print(genre)
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let singlePrimeDigits: Set = [2, 3, 5, 7]

oddDigits.intersection(singlePrimeDigits).sorted()
oddDigits.symmetricDifference(singlePrimeDigits).sorted()
oddDigits.union(singlePrimeDigits).sorted()
oddDigits.subtracting(singlePrimeDigits).sorted()

let houseAnimals: Set = ["🐱", "🐶"]
let farmAnimals: Set = ["🐮", "🐱", "🐶", "🐔"]
let cityAnimals: Set = ["🐰", "🐹"]
houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers.count
namesOfIntegers[16]
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
airports.isEmpty
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("Old value \(oldValue)")
}
if let airportName = airports["DUB"] {
    print("Name \(airportName)")
} else {
    print("Not value")
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("\(airportCode)")
}

for airportName in airports.values {
    print("\(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

let a = 26
let b = 9
let c = 7

if a < b + c && b < a + c && c < b + c {
    print("exist")
} else {
    print("not exist")
}

let someArray = [0, 1, -3, 5, -2, -6, 6, 7, 9, 8, 2]
var sumOfPositiveNumbers = 0
var sumOFNegativeNumbers = 0
var qualityOfNegativeNumbers = 0
for i in someArray {
    if i >= 0 {
        sumOfPositiveNumbers = sumOfPositiveNumbers + i
    } else {
        sumOFNegativeNumbers = sumOFNegativeNumbers + i
        qualityOfNegativeNumbers += 1
    }
}
print("sumOfPositiveNumbers \(sumOfPositiveNumbers)")
print("sumOFNegativeNumbers \(sumOFNegativeNumbers)")
print("qualityOfNegativeNumbers \(qualityOfNegativeNumbers)")

var minItem = 0
minItem = someArray[0]
for i in someArray {
    if minItem > i {
        minItem = i
    }
}
print("minItem \(minItem)")
