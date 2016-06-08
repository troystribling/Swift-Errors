//: Playground - noun: a place where people can play

import Foundation

// public func reduce<T>(initial: T, @noescape combine: (T, Self.Generator.Element) throws -> T) rethrows -> T
// sum integers, sum is accumulator
[1, 2, 3].reduce(0) { (sum, val) in
    return sum + val
}

let a = [1, 2, 3].reduce(0) { $0 + $1 }
a

let aa = [1, 2, 3].reduce(0) { $0 * $1 }
aa

// if you write someting like this use reduce
var g = 0
for i in (1...3) {
    g += i
}
g

// different intial value
let aaa = [1, 2, 3].reduce(10) { $0 + $1 }
aaa


// anagram
let words = ["cat", "tac", "fitbit", "bitfit", "dog", "god", "nothing"]
words.reduce([String: [String]]()) { (anagrams, word) in
    
    anagrams
}
// let ss = Array(s.lowercaseString.characters)
//let sss = ss.sort()
//sss

// filter
// public func filter(@noescape includeElement: (Self.Generator.Element) throws -> Bool) rethrows -> [Self.Generator.Element]
//let h = [-1, 0, 1, 2, 3].filter { $0 > 0 }
//h
