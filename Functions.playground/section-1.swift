// Playground - noun: a place where people can play

import UIKit

//optionals as return values
func anyReturnValue() -> String? {
    return nil
}

// function params are const -> keine Nebeneffekte!
func testConst(string: String) {
//    string = "hello"
}

    //local var gets declared and can be changed -> not visible outside
func testConst2(var string: String) {
    string = "hello"
}

    //changes can be made and are visible outside
func testConst3(inout string: String) {
    string = "hello"
}

var input = "Whatever"
testConst(input)
println(input)
testConst2(input)
println(input)
//ampersand allows the modification (must be provided for safety)
testConst3(&input)
println(input)

//tuple as a return parameter
func calculateStats(numbers: [Int]) -> (max: Int, min: Int) {
    var max = numbers[0]
    var min = numbers[0]
    
    for number in numbers {
        if number > max {
            max = number
        }
        if number < min {
            min = number
        }
    }
    return (max, min)
}

let stats = calculateStats([2,6,4,3,9,0])
stats.min
stats.max


//function as function parameter (with exact function type)
func findMatches(numbers: [Int], matcher: (Int -> Bool)) -> [Int] {
    var matches = [Int]()
    for number in numbers {
        if matcher(number) {
            matches.append(number)
        }
    }
    return matches
}

    //function as input for other function
func canBeDevidedByTwo(number: Int) -> Bool {
    return number % 2 == 0
}

    //closure as input for other function
var mySpecialMatcher = {
    (number: Int) -> Bool in
    return number == 4
}

var numbers = [1,2,4,4,5,6,9,0]

findMatches(numbers, canBeDevidedByTwo)
findMatches(numbers, mySpecialMatcher)

// ?? as a new operator
var testVar: String? = "Haus"
println(testVar ?? "nüt")

for i in 1..<5 {
    println(i)
}

//array with default value
var testArray = [Double](count: 5, repeatedValue: 0.2)

//pattern matching
let somePoint = (1, 0)
switch somePoint {
case (0, 0):
    println("(0, 0) is at the origin")
case (_, 0):
    println("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    println("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    println("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    println("(\(somePoint.0), \(somePoint.1)) is outside of the box")
    
    
}

//function with default param
func printValue(value: String = "Hello World") {
    println(value)
}

printValue()

//CLOSURES
//closures theorie:
//name closure -> closing over vars (namensraum einschliessen)
//functions sind spezialfälle von closures
// was wir als closure bezeichnen {} ist closure expression

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let alphabetic = {(s1: String, s2: String) -> Bool in
    return s1 < s2
}
sorted(names, alphabetic)

//functions can be used as closures
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
sorted(names, backwards)

//inline closure:
sorted(names, {(s1: String, s2: String) -> Bool in
    return s1 < s2
})

//now we can make use of type inference (since function argument has defined closure types
sorted(names, {s1, s2 in
    return s1 < s2
})

//in single expression we can even omit the return keywork (like in groovy)
sorted(names, {s1, s2 in s1 < s2})

//we can use shorthand arguments
sorted(names, {$0 < $1})

// and it goes even shorter due to the inference of the < operator (two arguments in row)
sorted(names, <)



