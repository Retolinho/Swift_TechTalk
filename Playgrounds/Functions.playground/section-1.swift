// Playground - noun: a place where people can play

import UIKit

// 1 einfache funktion um syntax zu sehen
func echo(input: String) -> String {
    return input
}

echo("test")

// 1.2 auch Funktionen müssen definieren, wie sie mit nil umgehen wollen
//echo(nil) // -> nil als Input ungültig, da Input Type kein Optional Type
// korrigieren Input Type zu Optional -> neuer Fehler in Methode
// füge Unwrapp hinzu -> BadExc
// fühe Optional als Return Typ hinzu

// 2. Argumente einer Funktion sind const -> Einschränkung von Nebeneffekten (wie Java final)
    //2.1 Beispiel einer normalen Methode (UIView weil Copy by Reference)
func arg(view: UIView) {
//    view = UIView(frame: CGRectMake(0, 0, 20, 40)) // -> es wird eine neue let view definiert in method scope
}

    //2.2 Argument wird explizit als var angegeben
func argVar(var view: UIView) {
    view = UIView(frame: CGRectMake(0, 0, 20, 40))
}

    //Definition einer UIView als input um Methode zu testen
var input = UIView(frame: CGRectMake(0, 0, 100, 100))
argVar(input)
println(input.frame) // -> frame ist nicht verändert obwohl in methode kleiner -> definierte var ist nur method scope ist also pass by value (wie Java)

    //Damit changes zurück gehen muss inout angegeben werden (und somit pass by reference ermöglichen)
func argInOut(inout view: UIView) {
    view = UIView(frame: CGRectMake(0, 0, 20, 40))
}

    //Auf der Seite des Aufrufenden muss zusätzlich noch ein Ampersand angegeben werden (da reference)
argInOut(&input)
println(input.frame) // -> nun ist input.frame verändert

//Einschub: zeige Playground Funktion zuerst weiss, dann blau
input.backgroundColor = UIColor.blueColor() // just to show playground fun -> right side
//etwas mehr Playground fun
for i in 0...255 {
    input.backgroundColor = UIColor(white: CGFloat(i)/255, alpha: 1)
}


    //3. Funktionen sind first class citizens in Swift
// 3.1. Funktion als Parameter einer Funktion (mit exakten Argument und Return Typen)
func findMatches(numbers: [Int], matcher: (Int -> Bool)) -> [Int] {
    var matches = [Int]()
    for number in numbers {
        if matcher(number) {
            matches.append(number)
        }
    }
    return matches
}

    //Input Funktion muss passende Signatur haben
func canBeDevidedByTwo(number: Int) -> Bool {
    return number % 2 == 0
}

    //Test
var numbers = [1,2,4,4,5,6,9,0]
findMatches(numbers, canBeDevidedByTwo) // -> Funktion wird über Name referenziert

    //3.2. Statt Funktion kann auch Closure definiert werden -> Zuweisung an Variable
var isFour = {
    (number: Int) -> Bool in //definition der Closure, Input und Output abgetrent von Body (in)
    return number == 4
}

findMatches(numbers, isFour)

//4. Closures
//Hier mal etwas Syntax um die einfachheit zu demonstrieren
    //4.1. simples Beispiel wie oben um zu beginnen, dann schrittweise anpassen
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

let alphabeticSort = {(s1: String, s2: String) -> Bool in
    return s1 < s2
}

names.sorted(alphabeticSort)

    //4.2. inline closure von oben
names.sorted{(s1: String, s2: String) -> Bool in
    return s1 < s2
}

    //4.3. Typinferenz benutzen (Weil die Sorted Funktion Argumente/Returntyp definiert)
        //sorted referenz zeigen!
names.sorted{s1, s2 in
    return s1 < s2
}

    // -> dasselbe klappt gemäss referenz mit jedem array typ (voraussetzung ist operator < für typ)
let integers = [3,9,6,4]
integers.sorted({s1, s2 in
    return s1 < s2
})

    //4.4. Bei Single line Statment kann return weggelassen werden (wie in groovy)
names.sorted{s1, s2 in s1 < s2}

    //4.5. Statt den Input zu definieren können Shorthand Arguments benutzt werden
names.sorted{$0 < $1}

    //4.6. Es geht noch kürzer, da < als function in String definiert ist (Typinferenz)
names.sorted(<)

//5. Swift bietet neben sorted auch funktionen wie map, filter an (wie Groovy oder was Java 8 gerne möchte)
