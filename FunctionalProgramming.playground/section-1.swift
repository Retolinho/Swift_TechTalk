// Playground - noun: a place where people can play

import UIKit

extension Array {
    func mymap<R>(f: T -> R) -> [R] {
        var result: [R] = []
        for x in self {
            let y = f(x)
            result.append(y)
        }
        return result
    }
    func myfilter(f: T -> Bool) -> [T] {
        var result: [T] = []
        for x in self {
            if f(x) {
                result.append(x)
            }
        }
        return result
    }

    func myreduce<R>(start: R, f: (R,T) -> R) -> R {
        var result = start
        for x in self {
            result = f(result, x)
        }
        return result
    }
}

let r1 = [1,2,3,4].mymap{x in x+1}
let r2 = ["hallo", "welt"].mymap{str in countElements(str)}
r1
r2


let r3 = [1,2,3,4].myreduce(0) {a, b in a+b}
r3




let r4 = [1,2,3,4,5,6,7,8,9,10]
            .myfilter{n in n % 2 == 0}
            .mymap{n in n*n}
            .myreduce(0) {a,b in a+b}
r4


// 2 uncoole sachen:
// - die notation fuer ein range koennte noch verbessert werden
// - pow als globale function ist nicht toll

extension Range {
    func toArray() -> [T] {
        var array: [T] = []
        for x in self {
            array.append(x)
        }
        return array
    }
    func myfilter(f: T -> Bool) -> [T] {
        return self.toArray().myfilter(f)
    }
    func mymap<R>(f: T -> R) -> [R] {
        return self.toArray().mymap(f)
    }
}

infix operator ** { associativity left precedence 160 }
func ** (n: Int, power: Int) -> Int {
    var res = 1
    for i in 0..<power {
        res *= n
    }
    return res
}

2 ** 16

let r5 = (1...10)
            .myfilter{n in n % 2 == 0}
            .mymap{n in n ** 2}
            .myreduce(0) {a,b in a+b}
r5


// Unterstützung für map/filter/reduce schon in der Sprache
let r6 = [1,2,3,4,5,6,7,8,9,10]
            .filter{n in n % 2 == 0}
            .map{n in n*n}
            .reduce(0) {a,b in a+b}
r6

