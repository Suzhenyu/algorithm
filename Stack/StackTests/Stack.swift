public struct Stack<T> {
    fileprivate var array = [T]()
    
    // 平均时间复杂度为 O(1)
    public mutating func push(_ newElement: T) {
        array.append(newElement)
    }
    
    // 时间复杂度为 O(1)
    @discardableResult
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    // 时间复杂度为 O(1)
    public func peek() -> T? {
        return array.last
    }
    
    // 时间复杂度为 O(1)
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    // 时间复杂度为 O(1)
    public var count: Int {
        return array.count
    }
    
    // 时间复杂度为 O(1)
    public var top: T? {
        return array.last
    }
}
