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

class PersonTwo {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit {
        print("\(name) deinit")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: PersonTwo?
    deinit {
        print("\(unit) deinit")
    }
}

var john: PersonTwo?
var unit4a: Apartment?
john = PersonTwo(name: "John Appleseed")
unit4a = Apartment(unit: "4a")
john?.apartment = unit4a
unit4a?.tenant = john

john = nil
unit4a = nil

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) deinit")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("\(number) deinit")
    }
}

var johnApple: Customer?
johnApple = Customer(name: "John Appleseed")
johnApple?.card = CreditCard(number: 1234567812345678, customer: johnApple!)
johnApple = nil
