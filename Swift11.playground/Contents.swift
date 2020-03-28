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
