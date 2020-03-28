import UIKit

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventery = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinDeposited = 0
    func vend(itemNamed name: String) throws {
        guard let item = inventery[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinDeposited)
        }
        
        coinDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventery[name] = newItem
        
        print("Sale: \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

var vendingMachine = VendingMachine()
vendingMachine.coinDeposited = 10
do {
    try buyFavoriteSnack(person: "Eve", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid selection")
} catch VendingMachineError.outOfStock {
    print("Out of stock")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient Funds add \(coinsNeeded) coins")
}

func someThrowingFunc() throws -> Int {
    return 0
}

let x = try? someThrowingFunc()

let y: Int?
do {
    y = try someThrowingFunc()
} catch {
    y = nil
}

//let photo = try! loadImage(atPath: "./Resourse/John.jpg")

//func processFile(fileName: String) throws {
//    if exists(fileName) {
//        let file = open(fileName)
//        defer {
//            close(file)
//        }
//    }
//    while let line = try file.readline() {
//
//    }
//     close(file)
//}

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Shuede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
print("In library \(songCount) songs and \(movieCount) movies")

for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), director \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), artist \(song.artist)")
    }
}

var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("Hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Raytman"))
things.append({ (name: String) -> String in "Hello \(name)"})

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as Int")
    case 0 as Double:
        print("zero as Double")
    case let someInt as Int:
        print(someInt)
    case let someDouble as Double where someDouble > 0:
        print(someDouble)
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("\(someString)")
    case let (x, y) as (Double, Double):
        print("\(x), \(y)")
    case let movie as Movie:
        print("Movie: \(movie.name), director \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

let optionalNumber: Int? = 3
things.append(optionalNumber as Any)
