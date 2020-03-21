import UIKit

enum CompassPoint: String {
    case north
    case south
    case east
    case west
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
directionToHead = .east

switch directionToHead {
case .north:
    print("Let go to North")
case .south:
    print("Let go to South")
case .east:
    print("Let go to East")
case .west:
    print("Let go to West")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("It has Life")
default:
    print("It has not life")
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 85099, 51226, 3)
//productBarcode = .qrCode("abcdefhi")
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR Code: \(productCode)")
}

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

let earthOrder = Planet.earth.rawValue
let sunsetDirection = CompassPoint.west.rawValue
let possiblePlanet = Planet.init(rawValue: 7)
let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
    print("This planet exists")
} else {
    print("This planet \(somePlanet) unexists")
}

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("HD: \(hd.width)")
print("Cinema: \(cinema.width)")
var curDirection = CompassPoint.west
let rememberDirection = curDirection
curDirection = .east
print(rememberDirection.rawValue)
print(curDirection.rawValue)

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("Frame rate: \(tenEighty.frameRate)")

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

class DataImporter {
    var fileName = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}
let manager = DataManager()
manager.data.append("Something")
manager.data.append("Something more")
print("\(manager.importer.fileName)")

struct Point {
    var x = 0.0
    var y = 0.0
}
struct Size {
    var width = 0.0
    var height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - size.width / 2
            origin.y = newCenter.y - size.height / 2
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 8.0))
let initialSquareCenter = square.center
square.center = Point(x: 7.0, y: 6.0)
print(square.origin)

struct Cuboid {
    var width = 0.0
    var height = 0.0
    var depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let cub = Cuboid(width: 4, height: 5, depth: 2)
print(cub.volume)

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("Now value will equil \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue)")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 350
stepCounter.totalSteps = 180

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 26
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value"
print(SomeStructure.storedTypeProperty)

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannel = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannel {
                AudioChannel.maxInputLevelForAllChannel = currentLevel
            }
        }
    }
}
var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannel)
rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannel)

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()

counter.increment()
counter.count
counter.increment(by: 5)
counter.count
counter.reset()
counter.count

struct PointTwo {
    var x = 0.0
    var y = 0.0
    func isTpTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePointTwo = PointTwo(x: 4.0, y: 5.0)
if somePointTwo.isTpTheRightOf(x: 1.0) {
    print("This point is right from line where x = 1.0")
}

somePointTwo.moveBy(x: 2.0, y: 3.0)
print("\(somePointTwo)")

var fixedPoint = PointTwo(x: 3, y: 3)
fixedPoint.moveBy(x: 2, y: 3)

struct PointThree {
    var x = 0.0
    var y = 0.0
    func isTpTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = PointThree(x: x + deltaX, y: y + deltaY)
    }
}
var somePointThree = PointThree(x: 4.0, y: 5.0)
if somePointThree.isTpTheRightOf(x: 1.0) {
    print("This point is right from line where x = 1.0")
}

somePointThree.moveBy(x: 2.0, y: 3.0)
print("\(somePointThree)")

enum TriStateSwitch {
    case off
    case low
    case high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var overLight = TriStateSwitch.low
overLight.next()
overLight
overLight.next()
overLight
overLight.next()
overLight

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func comlete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}
var player = Player(name: "Tim")
player.comlete(level: 1)
print("Max level - \(LevelTracker.highestUnlockedLevel)")
player = Player(name: "Andrey")
if player.tracker.advance(to: 2) {
    print("Level 2")
} else {
    print("Level 6 is not ")
}

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("6 * 3 = \(threeTimesTable[6])")
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
