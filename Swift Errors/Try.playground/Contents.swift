import Foundation

public enum Try<T> {

    case Success(T)
    case Failure(NSError)

    public init(_ value:T) {
        self = .Success(value)
    }

    public init(_ error: NSError) {
        self = .Failure(error)
    }

    public func isSuccess() -> Bool {
        switch self {
        case .Success:
            return true
        case .Failure:
            return false
        }
    }

    public func isFailure() -> Bool {
        switch self {
        case .Success:
            return false
        case .Failure:
            return true
        }
    }

    public func map<M>(mapping: T -> M) -> Try<M> {
        switch self {
        case .Success(let value):
            return Try<M>(mapping(value))
        case .Failure(let error):
            return Try<M>(error)
        }
    }

    public func flatMap<M>(mapping: T -> Try<M>) -> Try<M> {
        switch self {
        case .Success(let value):
            return mapping(value)
        case .Failure(let error):
            return Try<M>(error)
        }
    }

    public func toOptional() -> Optional<T> {
        switch self {
        case .Success(let value):
            return Optional<T>(value)
        case .Failure(_):
            return Optional<T>()
        }
    }

    public func getOrElse(failed: T) -> T {
        switch self {
        case .Success(let value):
            return value
        case .Failure(_):
            return failed
        }
    }
    
}
