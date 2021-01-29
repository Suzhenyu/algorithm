// 参考链接：https://github.com/raywenderlich/swift-algorithm-club/tree/master/Linked%20List

public class DoublyLinkedList<T> {
  public class DoublyLinkedListNode<T> {
    var value: T
    var next: DoublyLinkedListNode?
    weak var previous: DoublyLinkedListNode?
    
    public init(value: T) {
      self.value = value
    }
  }
  
  public typealias Node = DoublyLinkedListNode<T>
  
  private var head: Node?
  
  public var last: Node? {
    guard var node = head else {
      return nil
    }
    
    while let next = node.next {
      node = next
    }
    return node
  }
  
  public var isEmpty: Bool {
    return head == nil
  }
  
  public var count: Int {
    guard var node = head else {
      return 0
    }
    
    var count = 1
    while let next = node.next {
      node = next
      count += 1
    }
    return count
  }
  
  public init() {}
  
  public func node(at index: Int) -> Node {
    assert(head != nil, "List is empty")
    assert(index >= 0, "index must be greater or equal to ")
    
    if index == 0 {
      return head!
    } else {
      var node = head!.next
      for _ in 1..<index {
        node = node?.next
        if node == nil {
          break
        }
      }
      
      assert(node != nil, "index is out of bounds")
      return node!
    }
  }
  
  public func append(_ value: T) {
    let node = Node(value: value)
    append(node)
  }
  
  public func append(_ node: Node) {
    let newNode = node
    if let lastNode = last {
      newNode.previous = lastNode
      lastNode.next = newNode
    } else {
      head = newNode
    }
  }
  
  public func insert(_ value: T, at index: Int) {
    let node = Node(value: value)
    insert(node, at: index)
  }
  
  public func insert(_ newNode: Node, at index: Int) {
    if index == 0 {
      newNode.next = head
      head?.previous = newNode
      head = newNode
    } else {
      let prev = node(at: index - 1)
      let next = prev.next
      newNode.previous = prev
      newNode.next = next
      prev.next = newNode
      next?.previous = newNode
    }
  }
  
  public func removeAll() {
    head = nil
  }
  
  @discardableResult
  public func remove(node: Node) -> T {
    let prev = node.previous
    let next = node.next
    
    if let prev = prev {
      prev.next = next
    } else {
      head = next
    }
    next?.previous = prev
    
    node.previous = nil
    node.next = nil
    return node.value
  }
  
  @discardableResult
  public func removeLast() -> T {
    assert(!isEmpty)
    
    return remove(node: last!)
  }
  
  @discardableResult
  public func remove(at index: Int) -> T {
    let node = self.node(at: index)
    return remove(node: node)
  }
}
