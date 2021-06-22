//
//  DequeTest.swift
//  DequeTest
//
//  Created by Meng on 2021/6/22.
//

import XCTest

class DequeTest: XCTestCase {
    
    func testIsEmpty() {
        var deque = Deque<Int>()
        XCTAssertTrue(deque.isEmpty)
        deque.enqueue(1)
        XCTAssertFalse(deque.isEmpty)
    }
    
    func testConut() {
        var deque = Deque<Int>()
        XCTAssertTrue(deque.count == 0)
        deque.enqueue(1)
        XCTAssertTrue(deque.count == 1)
    }
    
    func testEnqueue() {
        var deque = Deque<Int>()
        XCTAssertTrue(deque.count == 0)
        XCTAssertTrue(deque.isEmpty)
        deque.enqueue(1)
        XCTAssertTrue(deque.count == 1)
        XCTAssertFalse(deque.isEmpty)
        if let front = deque.peekFront() {
            XCTAssertTrue(front == 1)
        }
        if let back = deque.peelBack() {
            XCTAssertTrue(back == 1)
        }
        deque.enqueue(2)
        XCTAssertTrue(deque.count == 2)
        XCTAssertFalse(deque.isEmpty)
        if let front = deque.peekFront() {
            XCTAssertTrue(front == 1)
        }
        if let back = deque.peelBack() {
            XCTAssertTrue(back == 2)
        }
    }
    
    func testEnqueueFront() {
        var deque = Deque<Int>()
        XCTAssertTrue(deque.count == 0)
        XCTAssertTrue(deque.isEmpty)
        deque.enqueueFront(1)
        XCTAssertTrue(deque.count == 1)
        XCTAssertFalse(deque.isEmpty)
        if let front = deque.peekFront() {
            XCTAssertTrue(front == 1)
        }
        if let back = deque.peelBack() {
            XCTAssertTrue(back == 1)
        }
        deque.enqueueFront(2)
        XCTAssertTrue(deque.count == 2)
        XCTAssertFalse(deque.isEmpty)
        if let front = deque.peekFront() {
            XCTAssertTrue(front == 2)
        }
        if let back = deque.peelBack() {
            XCTAssertTrue(back == 1)
        }
    }
    
    func testDequeue() {
        var deque = Deque<Int>()
        deque.enqueue(1)
        deque.enqueue(2)
        deque.enqueue(3)
        
        if let front = deque.dequeue() {
            XCTAssertTrue(front == 1)
        }
        if let front = deque.dequeue() {
            XCTAssertTrue(front == 2)
        }
        if let front = deque.dequeue() {
            XCTAssertTrue(front == 3)
        }
        if let _ = deque.dequeue() {
            XCTFail("这里应该是 nil 的")
        }
    }
    
    func testDequeueBack() {
        var deque = Deque<Int>()
        deque.enqueue(1)
        deque.enqueue(2)
        deque.enqueue(3)
        
        if let front = deque.dequeueBack() {
            XCTAssertTrue(front == 3)
        }
        if let front = deque.dequeueBack() {
            XCTAssertTrue(front == 2)
        }
        if let front = deque.dequeueBack() {
            XCTAssertTrue(front == 1)
        }
        if let _ = deque.dequeue() {
            XCTFail("这里应该是 nil 的")
        }
    }
}
