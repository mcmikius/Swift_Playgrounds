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
