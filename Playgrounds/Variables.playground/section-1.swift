// Playground - noun: a place where people can play

import UIKit

//Thema: Variablen, Konstanten
//Unterthemen: Typinferenz, statische Typisierung, Optionals

// 1: Ein kleines Hello World zur Demonstration von Playground und aus Tradition
println("Hello world")

// Einschub: coole utf8 constanten/variablen declarationen
let 🐶 = "hello"
let π = 3.14

// 2: Statische Typisierung
var aString: String = "Hello world"
//aString = 7 -> kann nicht zugewiesen werden

// 3: Typinferenz
var myString = "some text" //wird aufgelöst anderst als in Skriptsprachen
//myString = 7 -> myString wird implizit als String definiert

    // 2.2: Typinferenz kann und muss manchmal übersteuert werden
var typeInfered = 6 // -> int
typeInfered = 8.7

var myVar: Double = 6 // -> wenn ich Double will muss ich ihn angeben
myVar = 8.7

// 3. Optionals
var anotherString: String = "test"
//anotherString = nil // -> nil (null) kann nicht zugewiesen werden bei nicht optional
//Diskussion: null opt-in statt opt-out bei Java (@NonNull) und enforced by compiler!!!

//Nil ist in Swift "absence of value" kein spezieller Typ -> geht für alle Typen (auch primitive)
//enum Optional {
//  case None
//  case Some(T)
//}

var nullableString: String? = nil
var nullableInt: Int? = nil // -> int i = null ist nicht möglich in java, fehlerfall nicht signalisierbar (zB ErrorCode)
nullableString = "test"

    // 3.1 explicit unwrapping
//nullableString.isEmpty // -> auf optional kann methode oder member nicht aufgerufen werden
//da sprache statisch typisiert ist weiss Compiler nicht ob nil/nicht nil, nur dass optional
if nullableString != nil {
    nullableString!.isEmpty
}

    // 3.2. optional binding als Pattern
if let mySafeString = nullableString {
    mySafeString.isEmpty // -> mySafeString ist kein Optional, kann normal benutzt werden
}

    //3.3 realistisches beispiel
let anyString = "xy"
var intAsString = anyString.toInt() // ->is infered as optional Int, da toInt Optional returniert
if let myInt = intAsString {
    println("Sum = \(myInt + 3)")
}
// anyString zu 4 wechseln

//theorie: optionals sind cool, schwer ist zur Zeit noch die Arbeit mit Cocoa Libraries.
//hier werden noch zu oft optionals returniert -> dann wird es witzlos
// apple ist aber dran mit jeder beta dies besser anzupassen

