// Playground - noun: a place where people can play

import UIKit


// Wie koennen wir die Grundfunktionen map, filter, reduce selber implementieren?

extension Array {
    func mymap<R>(f: Element -> R) -> [R] {
        var result: [R] = []
        for x in self {
            result.append(f(x))
        }
        return result
    }

    func myfilter(f: Element -> Bool) -> [Element] {
        var result: [Element] = []
        for x in self {
            if f(x) {
                result.append(x)
            }
        }
        return result
    }

    func myreduce<R>(start: R, f: (R,Element) -> R) -> R {
        var result = start
        for x in self {
            result = f(result, x)
        }
        return result
    }
}

let r1 = [1,2,3,4].mymap{x in x+1}
let r2 = ["hallo", "welt"].mymap{str in str.characters.count}
r1
r2


let r3 = [1,2,3,4].myreduce(0) {a, b in a+b}
r3




let r4 = [1,2,3,4,5,6,7,8,9,10]
let r5 = r4.myfilter{n in n % 2 == 0}
let r6 = r5.mymap{n in n*n}
let r7 = r6.myreduce(0) {a,b in a+b}
r7


// 2 uncoole Sachen:
// - die notation fuer ein Range koennte noch verbessert werden
// - keine Potenzfunktion

extension Range {
    func toArray() -> [Element] {
        var array: [Element] = []
        for x in self {
            array.append(x)
        }
        return array
    }
    func myfilter(f: Element -> Bool) -> [Element] {
        return self.toArray().myfilter(f)
    }
}

infix operator ** { associativity left precedence 160 }
func ** (n: Int, power: Int) -> Int {
    var res = 1
    for _ in 0..<power {
        res *= n
    }
    return res
}

2 ** 16

let r8 = (1...10)
            .myfilter{n in n % 2 == 0}
            .mymap{n in n ** 2}
            .myreduce(0) {a,b in a+b}
r8


// Unterstützung für map/filter/reduce schon in der Sprache
let r9 = [1,2,3,4,5,6,7,8,9,10]
            .filter{n in n % 2 == 0}
            .map{n in n*n}
            .reduce(0) {a,b in a+b}
r9

