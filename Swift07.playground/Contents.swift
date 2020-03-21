import UIKit

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
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
