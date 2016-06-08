import Foundation

public enum Try<T> {

    case Success(T)
    case Failure(ErrorType)

    public init(_ value:T) {
        self = .Success(value)
    }

    public init(_ error: ErrorType) {
        self = .Failure(error)
    }

    @warn_unused_result
    public func map<M>(@noescape mapping: T throws -> M) -> Try<M> {
        switch self {
        case .Success(let value):
            do {
                return try Try<M>(mapping(value))
            } catch {
                return Try<M>(error)
            }
        case .Failure(let error):
            return Try<M>(error)
        }
    }

    @warn_unused_result
    public func flatMap<M>(@noescape mapping: T throws -> Try<M>) -> Try<M> {
        switch self {
        case .Success(let value):
            do {
                return try mapping(value)
            } catch {
                return Try<M>(error)
            }
        case .Failure(let error):
            return Try<M>(error)
        }
    }

    public func throwIfError() throws {
        switch self {
        case .Success:
            break
        case .Failure(let error):
            throw error
        }
    }

    public func onSuccess(@noescape callback: T -> Void) {
        switch self {
        case .Success(let value):
            callback(value)
        case .Failure:
            break
        }
    }

    public func onFailure(@noescape callback: ErrorType -> Void) {
        switch self {
        case .Success:
            break
        case .Failure(let error):
            callback(error)
        }
    }

}

enum ExampleError : ErrorType {
    case Failed, ReallyFailed
}

// create error
let a = Try<Int>(1)
let b = Try<Int>(ExampleError.Failed)

// map successs
let c = a.map { $0 + 1 }
c

// chain surequests
let cc = a.map { $0 + 1 }.map { 2 * $0 }
cc

// print value
switch cc {
case .Success(let value):
    print(value)
case .Failure(let error):
    print(error)
}

// success callbacks
cc.onSuccess { val in
    print("cc onSuccess: \(val)")
}

cc.onFailure { error in
    print("cc onFailure: \(error)")
}

// onfailure callback
b.onSuccess { val in
    print("b onSuccess: \(val)")
}

b.onFailure { error in
    print("b onFailure: \(error)")
}

// throw caught error
do {
    try cc.throwIfError()
    print("No Error")
} catch {
    print(error)
}

// map failure
let d = b.map { print("Called"); $0 + 1 }
d

// map function that throws exception. needed to change error state
func throwsError(val: Int) throws -> Int {
    guard val < 0 else {
        throw ExampleError.ReallyFailed
    }
    return val - 1
}

// perform map throwing error
let f = a.map { try throwsError($0) }
f

// throw exception
do {
    try f.throwIfError()
} catch {
    print(error)
}

// mapping function that returns Try. Does not need to throw to report error.
func returnTry(val: Int) -> Try<Int> {
    guard val < 0 else {
        return Try<Int>(ExampleError.Failed)
    }
    return Try<Int>(val - 1)
}

let p = Try<Int>(-1)
let pp = p.flatMap { returnTry($0) }
pp

// chain calls that fail
let ppp = p.flatMap { returnTry($0) }.flatMap { returnTry($0 + 5) }
ppp









