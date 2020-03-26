import UIKit

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) init")
    }
    deinit {
        print("\(name) deinit")
    }
}

var referenceOne: Person?
var referenceTwo: Person?
var referenceThree: Person?

referenceOne = Person(name: "John Appleseed")
referenceTwo = referenceOne
referenceThree = referenceOne

referenceOne = nil
referenceTwo = nil
referenceThree = nil

