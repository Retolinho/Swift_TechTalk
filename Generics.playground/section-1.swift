// Playground - noun: a place where people can play

import UIKit


// Basically similar to Java


// Generics Parameter für Methoden

func print<T: Printable>(t: T) {
    print(t.description)
}

print(5.0)


// Und für Klassen

class Stack<T> {
    private var values: [T] = []

    func push(t: T) {
        values.append(t)
    }
    
    func pop() -> T? {
        let n = countElements(values)
        if n > 0 {
            let t: T = values[n-1]
            values.removeAtIndex(n-1)
            return t
        }
        return nil;
    }
    
    func isEmpty() -> Bool {
        return countElements(values) == 0
    }
}


let s = Stack<Int>()
s.push(5)
s.push(10)
while (!s.isEmpty()) {
    println(s.pop())
}

