public struct RingBuffer<T> {
    private var array:[T?]
    private var readIndex = 0
    private var writeIndex = 0
    
    public init(_ count: Int) {
        array = [T?](repeating: nil, count: count)
    }
    
    fileprivate var availableSpaceForReading: Int {
        return writeIndex - readIndex
    }
    
    public var isEmpty: Bool {
        return availableSpaceForReading == 0
    }
    
    fileprivate var availableSpaceForWriting: Int {
        return array.count - availableSpaceForReading
    }
    
    public var isFull: Bool {
        return availableSpaceForWriting == 0
    }
    
    @discardableResult
    public mutating func write(_ element: T) -> Bool {
        if isFull {
            return false
        }
        
        array[writeIndex % array.count] = element
        writeIndex += 1
        return true
    }
    
    @discardableResult
    public mutating func read() -> T? {
        if isEmpty {
            return nil
        }
        
        let element = array[readIndex % array.count]
        readIndex += 1
        return element
    }
}
