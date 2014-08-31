// Playground - noun: a place where people can play

import UIKit


// 1. arrays

// immutable
let names = ["john", "helen", "reto"]

// not allowed
//names[0] = "alan"

countElements(names[0])
// not allowed
//foobar(names[0])


// mutable
var mutNames = ["john", "helen", "reto"]
mutNames.append("alan")
mutNames[0] = "alex"
mutNames



// 2. dictionaries

// immutable
let entries = [
    "Elefant": "großes, massiges Säugetier",
    "Giraffe": "großes, pflanzenfressendes Säugetier",
]


entries["Elefant"]
entries["Foobar"]

entries["Elefant"] == "großes, massiges Säugetier"



let entries2: Dictionary<String,Any> = [
    "Elefant": "großes, massiges Säugetier",
    "Giraffe": 5,
]



// mutable
var mutEntries = ["albert": 24, "john": 16]
mutEntries["helen"] = 36
mutEntries
