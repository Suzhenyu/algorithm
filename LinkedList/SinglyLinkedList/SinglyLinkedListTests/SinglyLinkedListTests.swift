//
//  SinglyLinkedListTests.swift
//  SinglyLinkedListTests
//
//  Created by Meng on 2021/6/16.
//

import XCTest

class SinglyLinkedListTests: XCTestCase {
    func testFirst() {
        let list = LinkedList()
        XCTAssertTrue(list.first == nil)
        list.append(1)
        XCTAssertTrue(list.first !== nil)
        XCTAssertTrue(list.first!.value == 1)
        list.append(2)
        XCTAssertTrue(list.first !== nil)
        XCTAssertTrue(list.first!.value == 1)
    }
    
    func testLast() {
        let list = LinkedList()
        XCTAssertTrue(list.last == nil)
        list.append(1)
        XCTAssertTrue(list.last !== nil)
        XCTAssertTrue(list.last!.value == 1)
        list.append(2)
        XCTAssertTrue(list.last !== nil)
        XCTAssertTrue(list.last!.value == 2)
    }
    
    func testCount() {
        let list = LinkedList()
        XCTAssertTrue(list.count == 0)
        list.append(1)
        XCTAssertTrue(list.count == 1)
        list.append(2)
        XCTAssertTrue(list.count == 2)
    }
    
    private func mockList() -> LinkedList {
        let list = LinkedList()
        list.append(0)
        list.append(1)
        list.append(2)
        list.append(3)
        return list
    }
    
    func testFind() {
        let list = mockList()
        
        let node0 = list.node(at: 0)
        XCTAssertTrue(node0 != nil)
        XCTAssertTrue(node0!.value == 0)
        let node1 = list.node(at: 1)
        XCTAssertTrue(node1 != nil)
        XCTAssertTrue(node1!.value == 1)
        
        let badNode0 = list.node(at: -1)
        XCTAssertTrue(badNode0 === nil)
        let badNode1 = list.node(at: list.count)
        XCTAssertTrue(badNode1 === nil)
    }
}
