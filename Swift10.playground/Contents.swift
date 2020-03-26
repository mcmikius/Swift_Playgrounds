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

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalCity: String) {
        self.name = name
        self.capitalCity = City(name: capitalCity, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Ukraine", capitalCity: "Kyiv")
print("Capital city of \(country.name) is \(country.capitalCity.name)")

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "</\(self.name)>"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) deinit")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello World!")
print(paragraph!.asHTML())
paragraph = nil


class PersonThree {
    var residence: Residence?
}
class Residence {
    var numberOfRooms = 1
}
let johnTwo = PersonThree()
if let roomCount = johnTwo.residence?.numberOfRooms {
    print("\(roomCount)")
} else {
    print("nil")
}
johnTwo.residence = Residence()
if let roomCount = johnTwo.residence?.numberOfRooms {
    print("\(roomCount)")
} else {
    print("nil")
}
