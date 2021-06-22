//
//  RingBufferTests.swift
//  RingBufferTests
//
//  Created by Meng on 2021/6/22.
//

import XCTest

class RingBufferTests: XCTestCase {

    func testWrite() {
        var buffer = RingBuffer<Int>(5)
        
        XCTAssertTrue(buffer.write(1))
        XCTAssertTrue(buffer.write(2))
        XCTAssertTrue(buffer.write(3))
        XCTAssertTrue(buffer.write(4))
        XCTAssertTrue(buffer.write(5))
        
        XCTAssertFalse(buffer.write(6))
    }
    
    func testRead() {
        var buffer = RingBuffer<Int>(5)
        buffer.write(1)
        buffer.write(2)
        buffer.write(3)
        buffer.write(4)
        buffer.write(5)
        
        XCTAssertTrue(buffer.read() == 1)
        XCTAssertTrue(buffer.read() == 2)
        XCTAssertTrue(buffer.read() == 3)
        
        buffer.write(6)
        buffer.write(7)
        
        XCTAssertTrue(buffer.read() == 4)
        XCTAssertTrue(buffer.read() == 5)
        XCTAssertTrue(buffer.read() == 6)
        XCTAssertTrue(buffer.read() == 7)
        
        XCTAssertTrue(buffer.read() == nil)
    }
}
