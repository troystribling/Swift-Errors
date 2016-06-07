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

}

enum ExampleError : ErrorType {
    case Failed, ReallyFailed
}


