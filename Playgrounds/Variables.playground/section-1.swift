// Playground - noun: a place where people can play

import UIKit

//Thema: Variablen, Konstanten
//Unterthemen: Typinferenz, statische Typisierung, Optionals

// 1: Ein kleines Hello World zur Demonstration von Playground und aus Tradition
print("Hello world")

// Einschub: coole utf8 constanten/variablen declarationen
let 🐨 = "koala"
let π = 3.14

// 2: Statische Typisierung
var aString: String = "Hello world"
//aString = 7 -> kann nicht zugewiesen werden

// 3: Typinferenz
var myString = "some text" //wird aufgelöst anderst als in Skriptsprachen
//myString = 7 -> myString wird implizit als String definiert

    // 2.2: Typinferenz kann und muss manchmal übersteuert werden
var a = 6 // -> int
// Fehler, da a vom Typ Int ist
// a = 8.7

var b: Double = 6 // -> wenn ich Double will muss ich ihn angeben
b = 8.7

// 3. Optionals
var str: String = "test"
//str = nil // -> nil (null) kann nicht zugewiesen werden bei nicht optional
//Diskussion: null opt-in statt opt-out bei Java (@NonNull) und enforced by compiler!!!

//Nil ist in Swift "absence of value" kein spezieller Typ -> geht für alle Typen (auch primitive)
//enum Optional {
//  case None
//  case Some(T)
//}

var nStr: String? = nil
var nInt: Int? = nil // -> int i = null ist nicht möglich in java, fehlerfall nicht signalisierbar (zB ErrorCode)
nStr = "test"

    // 3.1 explicit unwrapping
//nStr.isEmpty // -> auf optional kann methode oder member nicht aufgerufen werden
//da sprache statisch typisiert ist weiss Compiler nicht ob nil/nicht nil, nur dass optional
if nStr != nil {
    nStr!.isEmpty
}

    // 3.2. optional binding als Pattern
if let s = nStr {
    s.isEmpty // -> s ist kein Optional, kann normal benutzt werden
}

    //3.3 realistisches beispiel
let i = "xy"
var iString = Int(i) // ->is infered as optional Int, da toInt Optional returniert
if let myInt = iString {
    print("Sum = \(myInt + 3)")
}
// i zu 4 wechseln

//theorie: optionals sind cool, schwer ist zur Zeit noch die Arbeit mit Cocoa Libraries.
//hier werden noch zu oft optionals returniert -> dann wird es witzlos
// apple ist aber dran mit jeder beta dies besser anzu
