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

