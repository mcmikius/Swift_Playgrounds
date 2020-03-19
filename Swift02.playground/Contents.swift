import UIKit

var multilineStr = """
Long string

long String
"""
print(multilineStr)

var str = "\'Special\t \"symbols\" \\ \n New line"
print(str)

let dollarSign = "\u{24}"
let heart = "\u{1f496}"
let smile = "😆"

var emptyString = ""
var anotherEmpryString = String()
if emptyString == "" {
    print("empty")
}

if emptyString.isEmpty {
    print("empty")
}
