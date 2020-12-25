public struct Stack<T> {
    fileprivate var array = [T]()
    
    public mutating func push(_ newElement: T) {
        array.append(newElement)
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public var top: T? {
        return array.last
    }
}

//extension Stack: Sequence {
//    public func makeIterator() -> AnyIterator<T> {
//        var curr = self
//        return AnyIterator {
//            return curr.pop()
//        }
//    }
//}
