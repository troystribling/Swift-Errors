import Foundation

// public func map<U>(@noescape f: (Wrapped) throws -> U) rethrows -> U?
let a: Int? = 1
let b = a.map { $0 + 1 }
b

let c : Int? = nil
let d = c.map { $0 + 1 }
d

let dict = [1:"Blaze", 2:"Alta"]
let e = dict[1].map { "Fitbit \($0)" }
e

let f = dict[4].map { "Fitbit \($0)" }
f

let ff = dict[1].map { "Fitbit \($0)" }
ff

// usage patterns
func test1(val: Int?) -> Int? {
    guard let val = val else {
        return nil
    }
    return val + 1
}

func test2(val: Int?) -> Int? {
    return val.map { $0 + 1 }
}

// public func flatMap<U>(@noescape f: (Wrapped) throws -> U?) rethrows -> U?
let message: [String: AnyObject] = ["val1": Int(1), "val2": Double(3)]

let g = message["val1"].map { $0 as? Int }
g
g.dynamicType

let h = message["val1"].flatMap { $0 as? Int }
h
h.dynamicType

let i = message["val2"].flatMap { $0 as? String }
i

if let val = message["val1"], intVal = val as? Int {
    print(intVal)
}

// Implementaion
public extension Optional {

    func myMap<M>(f: Wrapped -> M) -> M? {
        switch self {
        case .Some(let value):
            return f(value)
        case .None:
            return nil
        }
    }

    func myFlatMap<M>(f: Wrapped -> M?) -> M? {
        switch self {
        case .Some(let value):
            return f(value)
        case .None:
            return nil
        }
    }
}

// 