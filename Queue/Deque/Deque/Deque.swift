public typealias Deque = Deque2

/// 实现一：使用数组实现，实现简单但效率很低，enqueueFront() 与 dequeue() 操作的时间复杂度为 O(N)。
public struct Deque1<T> {
    private var array = [T]()
    
    public init() {
        print("Deque 第一种实现")
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func enqueueFront(_ element: T) {
        array.insert(element, at: 0)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public mutating func dequeueBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    public func peekFront() -> T? {
        return array.first
    }
    
    public func peelBack() -> T? {
        return array.last
    }
}

/// 实现二：优化版本，操作都是 O(1) 的。
public struct Deque2<T> {
    private var array = [T?]()
    private var head: Int
    private var capacity: Int
    private let originalCapacity: Int
    
    public init(_ capacity: Int = 10) {
        print("Deque 第二种实现")
        
        self.capacity = max(capacity, 1)
        originalCapacity = self.capacity
        array = [T?](repeating: nil, count: capacity)
        head = capacity
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func enqueueFront(_ element: T) {
        /// 如果 head 等于 0，则前面没有剩余空间。
        /// 当发生这种情况时，我们在数组中添加了一大堆新的 nil 元素，这是一个 O(n)操作。
        /// 但由于这个操作不是在每次 enqueueFront() 调用时都会发生，
        /// 所以每次对 enqueueFront() 单独调用的时间复杂度，仍然可以认为是O(1)。
        if head == 0 {
            capacity *= 2
            let emptySpace = [T?](repeating: nil, count: capacity)
            array.insert(contentsOf: emptySpace, at: 0)
            head = capacity
        }
        
        head -= 1
        array[head] = element
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        if capacity >= originalCapacity && head >= capacity * 2 {
            let amountToRemove = capacity + capacity / 2
            array.removeFirst(amountToRemove)
            head -= amountToRemove
            capacity /= 2
        }
        
        return element
    }
    
    public mutating func dequeueBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    public func peekFront() -> T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
    
    public func peelBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.last!
        }
    }
}

