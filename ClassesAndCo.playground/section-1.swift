// Playground - noun: a place where people can play

import UIKit


// Protokoll- und Klassendefinition

protocol Animal {
    var name: String { get set }
    func move() -> String
    func makeSound() -> String
}

class Dog: Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func move() -> String {
        return "walk"
    }
    func makeSound() -> String {
        return "bark"
    }
}

class Bird: Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func move() -> String {
        return "fly"
    }
    func makeSound() -> String {
        return "whistle"
    }
}

class Pitbull: Dog {
    
    override func makeSound() -> String {
        return "woof"
    }
    
}

let animals: [Animal] = [Bird(name: "Wisti"), Dog(name: "Max"), Pitbull(name: "Jake")]

let sounds = animals.map { a in a.makeSound() }
let moves  = animals.map { a in a.move() }

sounds
moves
animals[0].name
//animals[0].foo


// Statische Methoden

class Chiwawa {
    //class var omgCount = 0
    class func stayInHandbag() -> String {
        return "OMG! I like that!"
    }
}

Chiwawa.stayInHandbag()


class Bulldog: Dog {
    var isHappy: Bool = true
    override var name: String {
        willSet{
            isHappy = false
        }
    }
}

let b = Bulldog(name: "Toby")
b.name = "Rusty"


// berechnete Properties

// afghanischer Windhund
class AfghanHound: Dog {
    var age: Double
    var dogAge: Double {
        get {
            return age * 7
        }
    }

    init(name: String, age: Double) {
        self.age = age
        super.init(name: name)
    }

}

let dog = AfghanHound(name: "Lumpi", age: 5)
dog.dogAge


/*
Fragen:
- Konstrukte, die ich nicht erwaehne: lazy, weak
- Modifiers fuer Klassen, Properties, Methoden: public, internal, private
*/
