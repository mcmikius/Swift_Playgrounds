import Foundation

protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotToBeSettable: Int { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John")
print(john.fullName)

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator1 = LinearCongruentialGenerator()
print(generator1.random())
print(generator1.random())

protocol Toggable {
    mutating func toggle()
}

enum OnOffSwitch: Toggable {
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
    
    case off, on
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
print(lightSwitch)

protocol SomeProtocolThree {
    init()
}

class SomeSuperClass {
    init() {
        //
    }
    
}

class SomeSubClass: SomeSuperClass, SomeProtocolThree {
    required override init() {
        //
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}


var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Roll dice: \(d6.roll())")
}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08
        board[06] = +11
        board[09] = +09
        board[10] = +02
        board[14] = -10
        board[19] = -11
        board[22] = -02
        board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Start new game")
        }
        print("Dice \(game.dice.sides)")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print(diceRoll)
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("Time of game\(numberOfTurns)")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

protocol TextRepresentable {
    func textualDescription() -> String
}

extension Dice: TextRepresentable {
    func textualDescription() -> String {
        return "Dice has \(sides) sides"
    }
}

let d10 = Dice(sides: 10, generator: LinearCongruentialGenerator())
print(d10.textualDescription())

extension SnakesAndLadders: TextRepresentable {
    func textualDescription() -> String {
        return "Game Snakes and Ladders with \(finalSquare) squares"
    }
}
print(game.textualDescription())

struct Hamster {
    var name: String
    func textualDescription() -> String {
        return "Hamster names \(name)"
    }
}
extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription())

let things: [TextRepresentable] = [game, d10, simonTheHamster]
for thing in things {
    print(thing.textualDescription())
}

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription() + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "👆 "
            case let snake where snake < 0:
                output += "👇 "
            default:
                output += "0 "
            }
        }
        return output
    }
}

print(game.prettyTextualDescription)

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct VipPersone: Named, Aged {
    var name: String
    
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy Birthday, \(celebrator.name) you \(celebrator.age)")
}

let birthdayPerson = VipPersone(name: "Sasha", age: 21)
wishHappyBirthday(to: birthdayPerson)

class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}
func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)")
}

let seatle = City(name: "Seatle", latitude: 37.6, longitude: -122.6)
beginConcert(in: seatle)

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius}
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area equal \(objectWithArea.area)")
    } else {
        print("It is no has area")
    }
}


@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource? .fixedIncrement {
            count += amount
        }
    }
}

class ThreeSourse: NSObject, CounterDataSource {
    let fixedIncrement: Int = 3
}
var counter = Counter()

counter.dataSource = ThreeSourse()

for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()

for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let generatorBool = LinearCongruentialGenerator()
print("Random number: \(generatorBool.random())")
print("Random bool value: \(generatorBool.randomBool())")

extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription()
    }
}

extension Collection where Iterator.Element: TextRepresentable {
    func textualDescription() -> String {
        let itemsAsText = self.map { $0.textualDescription() }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, mauriceTheHamster, morganTheHamster]
print(hamsters.textualDescription())
