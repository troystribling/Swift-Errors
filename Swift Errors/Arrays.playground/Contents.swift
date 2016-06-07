import Foundation

// 
// Array map
//
// @noescape
// closure used in function call. cannot be saved. performance optimization

// Collection map
// public func map<T>(@noescape transform: (Self.Generator.Element) throws -> T) rethrows -> [T]

// For [Int]
// transform: Int -> String
// public func map(transform: Int -> String) -> [String]

[1, 2, 3].map { v -> String in
    let z = 2*v
    return "value = \(z)"
}

[1, 2, 3].map { v in
    "value = \(2*v)"
}

let a = [1, 2, 3].map { "value = \(2*$0)"}
a

// map combinator
let b = [1, 2, 3].map { 2*$0 }.map{ 3*$0 }
b

// 
// Array flatmap
//
// public func flatMap<S : SequenceType>(transform: (Self.Generator.Element) throws -> S) rethrows -> [S.Generator.Element]

// for [Int]
// transform: Int -> [Int]
// public func flatMap(transform: Int -> [Int]) -> [Int]
let c = [1, 2, 3].flatMap { [$0] }
c
let dict = [1:["San Francisco"], 2:["Columbia", "Annapolis", "Washinton D.C."], 3:["Nashville", "Knoxvile"]]
let d = [1, 2, 3].flatMap { dict[$0]! }
d

// transform: [Int] -> [Int]
// public func flatMap(transform: [Int] -> [Int]) -> [Int]
let e = [[1, 2, 3]].flatMap { $0 }
e

// transform: Int -> Int
// public func flatMap(transform: Int -> Int) -> [Int]
let f = [1, 2, 3].flatMap { 2*$0 }
f

// transform: Int -> Int
// public func flatMap(transform: AnyObject -> AnyObject) -> [AnyObject]
let g = [[1, 2], 3].flatMap { $0 }
g


// only maps one layer
// transform: [[Int]] -> [[Int]]
// public func flatMap(transform: [[Int]] -> [[Int]]) -> [[Int]]
let h = [[[1, 2, 3]]].flatMap { $0 }
h

//
// Array flatmap
//
// public func flatMap<T>(@noescape transform: (Self.Generator.Element) throws -> T?) rethrows -> [T]
let i = [1, 2, 3, 4].flatMap { dict[$0] }
i

let j = [1, 2, 3, 4].flatMap { dict[$0] }.flatMap { $0 }
j