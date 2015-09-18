// Playground - noun: a place where people can play

import UIKit


// extension method

extension Int {
    func times(f: () -> ()) {
        for _ in 0..<self {
            f()
        }
    }
}


5.times{ print("hallo") }


// extension properties

extension Double {
  var km: Double { return 1000 * self }
  var m:  Double { return self }
  var cm: Double { return self / 100 }
  var mm: Double { return self / 1000 }
  var inch: Double { return self * 2.54.cm }
}

5.km
let marathon = 42.km + 195.m
27.inch


// Missing method on String? No problem, add it

extension String {
  var length: Int { return self.characters.count }
}

"hallo".length


