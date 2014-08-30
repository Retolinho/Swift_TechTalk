// Playground - noun: a place where people can play

import UIKit

// 1: Start with a Hello World (and a more advanced one)
println("Hello world")
println("We have \(55*60) seconds left")

// 2: Type inference and strong typing
    // 2.1: var declaration and type inference
let π = 3.14
var myString = "some text"
//myString = 7

    // 2.2: type inference and explicit type
//var myVar = 6
//myVar = 8.7

var myVar: Float = 6
myVar = 7.8

    //2.3: type inference with arrays and dicts
var myArray = [5, 6]
//myArray.append("Hello")
myArray.append(7)

//var myDoubleArray = [Double]()
var myDoubleArray: [Double] = []
myDoubleArray.append(7.6)

var firstObject = myDoubleArray[0]
//firstObject = "String"

let myImmutableArray = ["First", "Second"]
//myImmutableArray.append("Third")
//myImmutableArray[0] = "Whatever"

for value in myImmutableArray {
    println(value)
}

var myFirstDict = [0.5:"First", 1.3: "Second"]
var secondValue = myFirstDict[1.3]
//secondValue = 6

for (key, value) in myFirstDict {
    println("\(key): \(value)")
}

// 3. Optionals
var anotherString: String = "test"
//anotherString = nil

//nil in swift is absence of value -> all types
var nullableString: String? = nil
var nullableInt: Int? = nil
nullableString = "test"

    // 3.1 explicit unwrapping
//nullableString.isEmpty
if nullableString != nil {
    nullableString!.isEmpty
}

    // 3.2. optional binding
if let mySafeString = nullableString {
    mySafeString.isEmpty
}

    //3.3 sophisticated example
let anyString = "xy"
//intAsString is infered as optional Int
var intAsString = anyString.toInt()
if let myInt = intAsString {
    println("Sum = \(myInt + 3)")
}


