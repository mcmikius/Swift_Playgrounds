import UIKit

struct Fahrenheit {
    var temperature = 32.0
}
var f = Fahrenheit()
print("Fahrenheit temperature value \(f.temperature)")

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 8.0
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
boilingPointOfWater.temperatureInCelsius
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.temperatureInCelsius
let bodyTemperature = Celsius(36.6)
bodyTemperature.temperatureInCelsius

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGrey = Color(white: 0.5)

class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I like it"

class ShopListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShopListItem()

struct Size {
    var width = 0.0
    var height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - size.width / 2
        let originY = center.y - size.width / 2
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
let basicRect = Rect()

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheels"
    }
}
let vehicle = Vehicle()
print("Vehicle has \(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle has \(bicycle.description)")

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Without name]")
    }
}
let namedMeat = Food(name: "Beacon")
namedMeat.name
let mysteryMeat = Food()
mysteryMeat.name

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
oneMysteryItem.name
let oneBeacon = RecipeIngredient(name: "Beacon")
oneBeacon.name
oneBeacon.quantity
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
sixEggs.name
sixEggs.quantity

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "✔︎" : "✕"
        return output
    }
}

var breakfastList = [
    ShoppingListItem(), ShoppingListItem(name: "Beacon"), ShoppingListItem(name: "SixEggs", quantity: 6)
]
breakfastList[0].name = "Juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

let mayBeNumber = "123"
if let number = Int(mayBeNumber) {
    print("\(number) is number")
} else {
    print("\(mayBeNumber) is not number")
}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("It is - \(giraffe.species)")
}
let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("No init animal")
}
enum TemperatureUnit {
    case kelvin
    case celsius
    case fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}
let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("It is temperature unit define")
}
let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("It is temperature unit undefine")
}
enum TemperatureUnitTwo: Character {
    case kelvin = "K"
    case celsius = "C"
    case fahrenheit = "F"
}
let fahrenheitUnitTwo = TemperatureUnitTwo(rawValue: "K")
if fahrenheitUnitTwo != nil {
    print("It is temperature unit define")
}
let unknownUnitTwo = TemperatureUnitTwo(rawValue: "K")
if unknownUnitTwo == nil {
    print("It is temperature unit undefine")
}

class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}
if let twoSocks = CartItem(name: "Socks", quantity: 2) {
    print("Think: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
if let zeroShirts = CartItem(name: "Shirt", quantity: 0) {
    print("Think: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Nothing")
}
if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Think: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Nothing")
}

class Document {
    var name: String?
    init() {}
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}
class AutomaticallyNameDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

class SomeClass {
    required init() {
        
    }
}
class SomeSubclass: SomeClass {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    required init() {
        self.name = "XXX"
    }
}

//class SomeNewClass {
//    let someProperty: SomeType = {
//        return someValue
//    }()
//}

struct Chessboard {
    let boardColors: [Bool] = {
        var tempBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                tempBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return tempBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
print(board.squareIsBlackAt(row: 7, column: 7))

class Bank {
    static var coinsInBank = 10000
    static func distribute(coins numberOfCoinsRequsted: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequsted, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("New player starts with \(playerOne!.coinsInPurse)")
print("Now in the bank \(Bank.coinsInBank)")
playerOne = nil
print("Player gameover")
print("Now in the bank \(Bank.coinsInBank)")
