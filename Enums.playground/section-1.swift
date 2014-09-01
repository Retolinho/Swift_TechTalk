// Playground - noun: a place where people can play

import UIKit


// Enum als Aufzaehlung

enum State {
    case Online
    case Offline
    case Crashed
}


// Jede Aufzaehlung kann noch durch eine oder mehrere Variablen angereicht werden

enum PersonActivity {
    case Sleeping
    case Working
    case ListeningToMusic(String)
    case Migraine(Int)
}

let activities = [
    PersonActivity.ListeningToMusic("Brian Eno"),
    PersonActivity.Sleeping,
    PersonActivity.Migraine(20)
]


// Pattern Matching

extension PersonActivity {
    func description() -> String {
        switch(self) {
        case .Migraine(let x) where x > 10: return "ouch!"
        case .Migraine(_): return "feeling dizzy!"
        case .ListeningToMusic("Brian Eno"): return "Good musical taste!"
        case .ListeningToMusic(_): return "Music is relaxing!"
        case _: return "Boring"
        }
    }
}


let strings = activities.map{act in act.description()}
strings


// Enum sind zurzeit leider nicht erlaubt, wenn der Werttyp einer Aufzaehlung
// wieder den Enumtyp referenziert (wuerde erlauben, baumartige Strukturen
// zu definieren)

//enum Exp {
//    case Number(Double)
//    case Add(Exp, Exp)
//}