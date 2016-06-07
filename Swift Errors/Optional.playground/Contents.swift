import Foundation

// public func map<U>(@noescape f: (Wrapped) throws -> U) rethrows -> U?
let a: Int? = 1
let b = a.map { $0 + 1 }
b

let c : Int? = nil
let d = c.map { $0 + 1 }
d

// public func flatMap<U>(@noescape f: (Wrapped) throws -> U?) rethrows -> U?
let dict = [1:"Blaze", 2:"Alta"]


