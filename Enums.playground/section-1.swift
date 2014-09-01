// Playground - noun: a place where people can play

import UIKit


enum State {
    case Online
    case Offline
    case Crashed
}


enum PersonActivity {
    case Sleeping
    case Working
    case ListeningToMusic(String)
    case Migraine(Int)
    
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

let activities = [
    PersonActivity.ListeningToMusic("Brian Eno"),
    PersonActivity.Sleeping,
    PersonActivity.Migraine(20)
]

let strings = activities.map{act in act.description()}
strings


// nicht erlaubt
//enum Exp {
//    case Number(Double)
//    case Add(Exp, Exp)
//}