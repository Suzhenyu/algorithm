//
//  main.swift
//  SinglyLinkedList
//
//  Created by Meng on 2021/1/29.
//

let list = LinkedList<String>()
print(list)

list.append(12)
list.append(58)
list.append(66)
list.printList()

let index = 2
if let node = list.node(at: index) {
    print("index = \(index), value = \(node.value)")
} else {
    print("index = \(index), value = nil")
}
