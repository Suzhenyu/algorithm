// 参考资料：https://www.geeksforgeeks.org/implementing-a-linked-list-in-java-using-class/

public class LinkedListNode {
    var value: Int
    var next: LinkedListNode?
    
    public init(_ value: Int = 0) {
        self.value = value
    }
}

public class LinkedList {
    public typealias Node = LinkedListNode
    
    public init() { }
    
    private let head = Node()   // 虚拟头结点或者叫哨兵结点
    
    public var first: Node? {
        return head.next
    }
    
    public var last: Node? {
        guard var node = first else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public var count: Int {
        var count = 0
        var node = head.next
        while let current = node {
            count += 1
            node = current.next
        }
        return count
    }
}

// 查找
extension LinkedList {
    public func node(at index: Int) -> Node? {
        guard index >= 0, index < count else {
//            assertionFailure("Index is out of bounds.")
            return nil
        }
        
        var node = head
        for _ in 0...index {
            node = node.next!   //这里是可以直接写 ! 的，因为上面已经判断过 index 是合法的，所以值是必定存在的
        }
        return node
    }
    
    public func node(after node: Node) -> Node? {
        return node.next
    }
    
    public func node(before node: Node) -> Node? {
        guard var cur = head.next else { return nil }
        
        if first === node {
            return nil
        } else {
            while let next = cur.next, next !== node {
                cur = next
            }
            //要么 next 不存在，要么 next 存在且 next === node
            return cur.next == nil ? nil : cur
        }
    }
}

// 插入
extension LinkedList {
    // 头插法
    public func prepend(_ value: Int) {
        let newNode = Node(value)
        newNode.next = head.next
        head.next = newNode
    }
    
    // 尾插法
    public func append(_ value: Int) {
        let newNode = Node(value)
        if let lastNode = last {
            lastNode.next = newNode
        } else {
            head.next = newNode
        }
    }
    
    public func insert(_ value: Int, at index: Int) {
    }
}

/// 删除
extension LinkedList {
    public func delete(_ value: Int) {
        var node = head
        
        while let next = node.next, next.value != value {
            node = next
        }
        
        //要么 next 不存在；要么 next 存在，但是 next.value == value
        if let next = node.next {
            node.next = next.next
        }
    }
    
    public func delete(at index: Int) {
        guard index >= 0, index < count else {
//            assertionFailure("Index is out of bounds.")
            return
        }
        
        var pre = head
        var cur = pre.next
        for _ in 0..<index {
            pre = cur!
            cur = cur!.next
        }
        pre.next = cur!.next
    }
}

/// 打印链表
extension LinkedList {
    public func printList() {
        var node = head.next
        var string = ""
        
        while let current = node {
            string += "\(current.value) -> "
            node = current.next
        }
        if string.hasSuffix(" -> ") {
            string = String(Array(string)[0...string.count - 5])
        }
        print(string)
    }
}
