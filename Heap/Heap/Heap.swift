public struct Heap<T> {
    internal var nodes = [T]()
    private var orderCriteria: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: nodes.count / 2 - 1, through: 0, by: -1) {
            shiftDown(i)
        }
    }
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    public var count: Int {
        return nodes.count
    }
    
    /// 获取堆顶元素
    public func peek() -> T? {
        return nodes.first
    }
    
    internal func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    internal func leftChildIndex(_ index: Int) -> Int {
        return index * 2 + 1
    }
    
    internal func rightChildIndex(_ index: Int) -> Int {
        return index * 2 + 2
    }
}

//堆化
extension Heap {
    private mutating func shiftUp(_ index: Int) {
        let current = nodes[index]
        
        var childIndex = index
        var parentIndex = self.parentIndex(childIndex)
        
        while childIndex > 0 && orderCriteria(current, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(childIndex)
        }
        
        nodes[childIndex] = current
    }
    
    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(index)
        let rightChildIndex = self.rightChildIndex(index)
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    private mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}

//增加
extension Heap {
    public mutating func insert(_ element: T) {
        nodes.append(element)
        shiftUp(nodes.count - 1)
    }
    
    public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for element in sequence {
            insert(element)
        }
    }
}

//替换
extension Heap {
    public mutating func replace(index: Int, value: T) {
        guard index >= 0, index < nodes.count else { return }
        
        remove(at: index)
        insert(value)
    }
}

// 删除
extension Heap {
    /// 删除堆顶元素
    @discardableResult public mutating func remove() -> T? {
        guard nodes.count > 0 else { return nil }
        
        if nodes.count == 1 {
            return nodes.removeFirst()
        } else {
            let node = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return node
        }
    }
    
    /// 删除指定索引位置的元素
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index >= 0, index < nodes.count else { return nil }
        
        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
    }
}
