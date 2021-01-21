//
//  LRUCache.swift
//  LRU
//
//  Created by Meng on 2021/1/20.
//
//
import Foundation

public class LRUCache<KeyType: Hashable> {
    private let maxSize: Int
    //缓存的存储器
    private var cache: [KeyType: Any] = [:]
    //优先队列，用来实现 LRU 特性
    private var priority: LinkedList<KeyType> = LinkedList<KeyType>()
    //实现过程中，需要经常性的在 priority 中删除元素，priority 是用双向链表构建的，执行删除操作的时间复杂度为 O(n)
    //为优化性能，所以添加这个属性用哈希表（就是字典）来存储 priority 中的结点，
    //当 priority 需要执行删除操作时，先用 O(1) 找到待删除的结点，再用 O(1) 删除结点
    private var key2node: [KeyType: LinkedList<KeyType>.LinkedListNode<KeyType>] = [:]
    
    public init(_ maxSize: Int) {
        self.maxSize = maxSize
    }
    
    public func set(_ key: KeyType, val: Any) {
        if cache[key] != nil {
            remove(key)
        }
        else if priority.count >= maxSize, let keyToRemove = priority.last?.value {
            remove(keyToRemove)
        }
        
        insert(key, val: val)
    }
    
    public func get(_ key: KeyType) -> Any? {
        guard let val = cache[key] else {
            return nil
        }
        
        remove(key)
        insert(key, val: val)
        
        return val
    }
    
    private func insert(_ key: KeyType, val: Any) {
        cache[key] = val
        priority.insert(key, atIndex: 0)
        guard let first = priority.first else {
            return
        }
        key2node[key] = first
    }
    
    private func remove(_ key: KeyType) {
        cache.removeValue(forKey: key)
        guard let node = key2node[key] else {
            return
        }
        priority.remove(node: node)
        key2node.removeValue(forKey: key)
    }
}
