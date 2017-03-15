// The MIT License (MIT)
//
// Copyright (c) 2015 pascaljette
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Quick/Quick

import XCTest

@testable import GearDataStructures

/// Tests for Swift Array extension methods
class GearDoublyLinkedListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}

extension GearDoublyLinkedListTests {
    
    //
    // MARK: empty list tests
    //

    func testEmptyList() {
        
        let myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        
        XCTAssertNil(myList.firstValue)
        XCTAssertNil(myList.lastValue)
    }
}

extension GearDoublyLinkedListTests {
    
    //
    // MARK: insertHeadTests
    //
    
    func testInsertHeadToEmptyList() {
    
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        let newNode = myList.insertHead(1)
        
        XCTAssertEqual(myList.firstValue, 1)
        XCTAssertEqual(myList.lastValue, 1)

        XCTAssertNil(newNode.previous)
        XCTAssertNil(newNode.next)
    }
    
    func testInsertHeadToOneElementList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        let tailAppend = myList.insertHead(1)
        let headAppend = myList.insertHead(2)
        
        XCTAssertEqual(myList.firstValue, 2)
        XCTAssertEqual(myList.lastValue, 1)

        XCTAssertNil(headAppend.previous)
        XCTAssertNotNil(headAppend.next?.element)
        XCTAssertTrue(headAppend.next?.element == 1)

        XCTAssertNil(tailAppend.next?.element)
        XCTAssertNotNil(tailAppend.previous?.element)
        XCTAssertTrue(tailAppend.previous?.element == 2)
    }
    
    func testInsertHeadToMultipleElementsList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        let tailAppend = myList.insertHead(1)
        _ = myList.insertHead(2)
        _ = myList.insertHead(3)
        let headAppend = myList.insertHead(4)
        
        XCTAssertEqual(myList.firstValue, 4)
        XCTAssertEqual(myList.lastValue, 1)

        XCTAssertNil(headAppend.previous)
        XCTAssertNotNil(headAppend.next?.element)
        XCTAssertTrue(headAppend.next?.element == 3)

        XCTAssertNil(tailAppend.next?.element)
        XCTAssertNotNil(tailAppend.previous?.element)
        XCTAssertTrue(tailAppend.previous?.element == 2)
    }
}

extension GearDoublyLinkedListTests {
    
    //
    // MARK: appendTests
    //
    
    func testAppendEmptyList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        let newNode = myList.append(1)
        
        XCTAssertEqual(myList.firstValue, 1)
        XCTAssertEqual(myList.lastValue, 1)

        XCTAssertNil(newNode.previous)
        XCTAssertNil(newNode.next)
    }
    
    func testAppendOneElementList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        let headAppend = myList.append(1)
        let tailAppend = myList.append(2)
        
        XCTAssertEqual(myList.firstValue, 1)
        XCTAssertEqual(myList.lastValue, 2)
        
        XCTAssertNil(headAppend.previous)
        XCTAssertNotNil(headAppend.next?.element)
        XCTAssertTrue(headAppend.next?.element == 2)
        
        XCTAssertNil(tailAppend.next?.element)
        XCTAssertNotNil(tailAppend.previous?.element)
        XCTAssertTrue(tailAppend.previous?.element == 1)
    }
    
    func testAppendMultipleElementsList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        let headAppend = myList.append(1)
        myList.append(2)
        myList.append(3)
        let tailAppend = myList.append(4)
        
        XCTAssertEqual(myList.firstValue, 1)
        XCTAssertEqual(myList.lastValue, 4)
        
        XCTAssertNil(headAppend.previous)
        XCTAssertNotNil(headAppend.next?.element)
        XCTAssertTrue(headAppend.next?.element == 2)
        
        XCTAssertNil(tailAppend.next?.element)
        XCTAssertNotNil(tailAppend.previous?.element)
        XCTAssertTrue(tailAppend.previous?.element == 3)
    }
}

extension GearDoublyLinkedListTests {
    
    //
    // MARK: insertBeforeTests
    //
    
    func testInsertBeforeOneElementList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        let lastNode = myList.append(1)
        let newNode = try! myList.insertBefore(lastNode, element: 2)

        XCTAssertEqual(myList.firstValue, 2)
        XCTAssertEqual(myList.lastValue, 1)

        XCTAssertNil(lastNode.next)
        XCTAssertNotNil(lastNode.previous?.element)
        XCTAssertTrue(lastNode.previous?.element == 2)
        
        XCTAssertNil(newNode?.previous)
        XCTAssertNotNil(newNode?.next?.element)
        XCTAssertTrue(newNode?.next?.element == 1)
    }
    
    func testInsertBeforeMultipleElementsList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        let firstNode = myList.append(1)
        let lastNode = myList.append(3)
        let newNode = try! myList.insertBefore(lastNode, element: 2)
        
        XCTAssertEqual(myList.firstValue, 1)
        XCTAssertEqual(myList.lastValue, 3)
        
        XCTAssertNil(firstNode.previous)
        XCTAssertNotNil(firstNode.next?.element)
        XCTAssertTrue(firstNode.next?.element == 2)
        
        XCTAssertNotNil(newNode?.previous?.element)
        XCTAssertTrue(newNode?.previous?.element == 1)
        XCTAssertNotNil(newNode?.next?.element)
        XCTAssertTrue(newNode?.next?.element == 3)
        
        XCTAssertNil(lastNode.next?.element)
        XCTAssertNotNil(lastNode.previous?.element)
        XCTAssertTrue(lastNode.previous?.element == 2)
    }
}

extension GearDoublyLinkedListTests {
    
    //
    // MARK: insertAfterTests
    //
    
    func testInsertAfterOneElementList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        let firstNode = myList.append(1)
        let newNode = try! myList.insertAfter(firstNode, element: 2)
        
        XCTAssertEqual(myList.firstValue, 1)
        XCTAssertEqual(myList.lastValue, 2)
        
        XCTAssertNil(firstNode.previous)
        XCTAssertNotNil(firstNode.next?.element)
        XCTAssertTrue(firstNode.next?.element == 2)
        
        XCTAssertNil(newNode?.next)
        XCTAssertNotNil(newNode?.previous?.element)
        XCTAssertTrue(newNode?.previous?.element == 1)
    }
    
    func testInsertAfterMultipleElementsList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        let firstNode = myList.append(1)
        let lastNode = myList.append(3)
        let newNode = try! myList.insertAfter(firstNode, element: 2)
        
        XCTAssertEqual(myList.firstValue, 1)
        XCTAssertEqual(myList.lastValue, 3)
        
        XCTAssertNil(firstNode.previous)
        XCTAssertNotNil(firstNode.next?.element)
        XCTAssertTrue(firstNode.next?.element == 2)
        
        XCTAssertNotNil(newNode?.previous?.element)
        XCTAssertTrue(newNode?.previous?.element == 1)
        XCTAssertNotNil(newNode?.next?.element)
        XCTAssertTrue(newNode?.next?.element == 3)
        
        XCTAssertNil(lastNode.next?.element)
        XCTAssertNotNil(lastNode.previous?.element)
        XCTAssertTrue(lastNode.previous?.element == 2)
    }
}

extension GearDoublyLinkedListTests {
    
    //
    // MARK: firstNodeOfValueTests
    //
    
    func testFirstNodeOfValueEmptyList() {
        
        let myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        let firstNodeOfValue = myList.firstNodeOfValue(0)
        
        XCTAssertNil(firstNodeOfValue)
    }
    
    func testFirstNodeOfValueOneElementList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        _ = myList.append(1)

        XCTAssertNotNil(myList.firstNodeOfValue(1))
        XCTAssertEqual(myList.firstNodeOfValue(1)?.element, 1)
        
        XCTAssertNil(myList.firstNodeOfValue(2))
    }
    
    func testFirstNodeOfValueMultipleElementsList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        _ = myList.append(1)
        _ = myList.append(2)
        _ = myList.append(3)
        _ = myList.append(1)
        _ = myList.append(5)
        _ = myList.append(6)
        
        XCTAssertNotNil(myList.firstNodeOfValue(1))
        XCTAssertEqual(myList.firstNodeOfValue(1)?.element, 1)
        
        XCTAssertNotNil(myList.firstNodeOfValue(1)?.next)
        XCTAssertEqual(myList.firstNodeOfValue(1)?.next?.element, 2)

        XCTAssertNil(myList.firstNodeOfValue(7))
    }
}


extension GearDoublyLinkedListTests {
    
    //
    // MARK: lastNodeOfValueTests
    //

    
    //
    // MARK: firstNodeOfValueTests
    //
    
    func testLastNodeOfValueEmptyList() {
        
        let myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        let firstNodeOfValue = myList.firstNodeOfValue(0)
        
        XCTAssertNil(firstNodeOfValue)
    }
    
    func testLastNodeOfValueOneElementList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        _ = myList.append(1)
        
        XCTAssertNotNil(myList.firstNodeOfValue(1))
        XCTAssertEqual(myList.firstNodeOfValue(1)?.element, 1)
        
        XCTAssertNil(myList.firstNodeOfValue(2))
    }
    
    func testLastNodeOfValueMultipleElementsList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        _ = myList.append(1)
        _ = myList.append(2)
        _ = myList.append(3)
        _ = myList.append(1)
        _ = myList.append(5)
        _ = myList.append(6)
        
        XCTAssertNotNil(myList.firstNodeOfValue(1))
        XCTAssertEqual(myList.firstNodeOfValue(1)?.element, 1)
        
        XCTAssertNotNil(myList.firstNodeOfValue(1)?.next)
        XCTAssertEqual(myList.firstNodeOfValue(1)?.next?.element, 2)
        
        XCTAssertNil(myList.firstNodeOfValue(7))
    }
}

extension GearDoublyLinkedListTests {

    func testRemoveNodeFromEmptyList() {
        
        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        
        XCTAssertTrue(myList.isEmpty)
        
        XCTAssertFalse(myList.removeHead())
        XCTAssertFalse(myList.removeTail())
        XCTAssertFalse(myList.removeFirstNodeOfValue(1))
        XCTAssertFalse(myList.removeLastNodeOfValue(1))
        
        XCTAssertTrue(myList.isEmpty)
    }
    
    func testRemoveHeadNodeFromOneElementList() {

        var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
        
        XCTAssertTrue(myList.isEmpty)
        
        XCTAssertFalse(myList.removeHead())
        XCTAssertFalse(myList.removeTail())
        XCTAssertFalse(myList.removeFirstNodeOfValue(1))
        XCTAssertFalse(myList.removeLastNodeOfValue(1))
        
        XCTAssertTrue(myList.isEmpty)
    }
}

extension GearDoublyLinkedListTests {
    
    func testInsertArrayPerformance() {
        
        let numberOfElements = 100000
        
        measure {
            
            var array = [Int]()
            
            for i in 0..<numberOfElements {
                array.append(i)
            }
        }

    }
    
    func testInsertListPerformance() {
        
        let numberOfElements = 100000

        measure {
            
            var linkedList = GearDoublyLinkedList<Int>()
            
            for i in 0..<numberOfElements {
                _ = linkedList.append(i)
            }
        }
    }
}

//    func removeNodeTests() {
//        
//        describe("removeNodeTests") {
//            
//            context("removeHead") {
//                
//                it("Should return true when removing from a single value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    
//                    expect(myList.removeHead()).to(beTrue())
//                    expect(myList.isEmpty).to(beTrue())
//                }
//                
//                it("Should return true when removing from a multiple value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    myList.append(2)
//                    myList.append(3)
//                    myList.append(4)
//                    
//                    expect(myList.removeHead()).to(beTrue())
//                    expect(myList.isEmpty).to(beFalse())
//                    expect(myList.firstValue).to(equal(2))
//                    expect(myList.lastValue).to(equal(4))
//                }
//            }
//            
//            context("removeTail") {
//                
//                it("Should return true when removing from a single value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    
//                    expect(myList.removeTail()).to(beTrue())
//                    expect(myList.isEmpty).to(beTrue())
//                }
//                
//                it("Should return true when removing from a multiple value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    myList.append(2)
//                    myList.append(3)
//                    myList.append(4)
//                    
//                    expect(myList.removeTail()).to(beTrue())
//                    expect(myList.isEmpty).to(beFalse())
//                    expect(myList.firstValue).to(equal(1))
//                    expect(myList.lastValue).to(equal(3))
//                }
//            }
//            
//            context("removeNode") {
//                
//                it("Should return true when removing from a single value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    let headNode = myList.append(1)
//                    
//                    expect(try! myList.removeNode(headNode)).to(beTrue())
//                    expect(myList.isEmpty).to(beTrue())
//                }
//                
//                it("Should return true when removing from a multiple value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    myList.append(2)
//                    let node = myList.append(3)
//                    myList.append(4)
//                    
//                    expect(try! myList.removeNode(node)).to(beTrue())
//                    expect(myList.isEmpty).to(beFalse())
//                    
//                    var nodeToCheck: GearDoublyLinkedList<Int>.NodeType? = myList.head
//                    expect(nodeToCheck!.element).to(equal(1))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck!.element).to(equal(2))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck!.element).to(equal(4))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck).to(beNil())
//                }
//            }
//            
//            context("removeNode") {
//                
//                it("Should return true when removing from a single value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    let headNode = myList.append(1)
//                    
//                    expect(try! myList.removeNode(headNode)).to(beTrue())
//                    expect(myList.isEmpty).to(beTrue())
//                }
//                
//                it("Should return true when removing from a multiple value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    myList.append(2)
//                    let node = myList.append(3)
//                    myList.append(4)
//                    
//                    expect(try! myList.removeNode(node)).to(beTrue())
//                    expect(myList.isEmpty).to(beFalse())
//                    
//                    var nodeToCheck: GearDoublyLinkedList<Int>.NodeType? = myList.head
//                    expect(nodeToCheck!.element).to(equal(1))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck!.element).to(equal(2))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck!.element).to(equal(4))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck).to(beNil())
//                }
//            }
//            
//            context("removeFirstNodeOfValue") {
//
//                it("Should return false when removing a non-existing value") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    
//                    expect(myList.removeFirstNodeOfValue(2)).to(beFalse())
//                    expect(myList.isEmpty).to(beFalse())
//                }
//                
//                it("Should return true when removing from a single value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    
//                    expect(myList.removeFirstNodeOfValue(1)).to(beTrue())
//                    expect(myList.isEmpty).to(beTrue())
//                }
//                
//                it("Should return true when removing from a multiple value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    myList.append(2)
//                    myList.append(3)
//                    myList.append(1)
//                    myList.append(2)
//                    myList.append(5)
//                    
//                    expect(myList.removeFirstNodeOfValue(2)).to(beTrue())
//                    expect(myList.isEmpty).to(beFalse())
//                    
//                    var nodeToCheck: GearDoublyLinkedList<Int>.NodeType? = myList.head
//                    expect(nodeToCheck!.element).to(equal(1))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck!.element).to(equal(3))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck!.element).to(equal(1))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck!.element).to(equal(2))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck!.element).to(equal(5))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck).to(beNil())
//                }
//            }
//            
//            context("removeLastNodeOfValue") {
//                
//                it("Should return false when removing a non-existing value") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    
//                    expect(myList.removeLastNodeOfValue(2)).to(beFalse())
//                    expect(myList.isEmpty).to(beFalse())
//                }
//                
//                it("Should return true when removing from a single value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    
//                    expect(myList.removeLastNodeOfValue(1)).to(beTrue())
//                    expect(myList.isEmpty).to(beTrue())
//                }
//                
//                it("Should return true when removing from a multiple value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    myList.append(2)
//                    myList.append(3)
//                    myList.append(1)
//                    myList.append(2)
//                    myList.append(5)
//                    
//                    expect(myList.removeLastNodeOfValue(2)).to(beTrue())
//                    expect(myList.isEmpty).to(beFalse())
//                    
//                    var nodeToCheck: GearDoublyLinkedList<Int>.NodeType? = myList.head
//                    expect(nodeToCheck!.element).to(equal(1))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck!.element).to(equal(2))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck!.element).to(equal(3))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck!.element).to(equal(1))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck!.element).to(equal(5))
//                    
//                    nodeToCheck = nodeToCheck!.next
//                    expect(nodeToCheck).to(beNil())
//                }
//            }
//        }
//    }
//}
//    //
//    // MARK: listQueryTests
//    //
//    
//    func listQueryTests() {
//        
//        describe("GearDoublyLinkedList lastNodeOfValue tests") {
//            
//            context("count tests") {
//                
//                it("Should return 0 for an empty list") {
//                    
//                    let myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    
//                    expect(myList.count).to(equal(0))
//                }
//                
//                it("Should return 1 for a list with a single value") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    
//                    expect(myList.count).to(equal(1))
//                }
//                
//                it("Should return proper count for a list with multiple values") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    myList.append(2)
//                    myList.append(3)
//                    myList.append(4)
//                    
//                    expect(myList.count).to(equal(4))
//                }
//                
//                it("Should return proper count for a list with multiple values after removal") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    myList.append(2)
//                    myList.append(3)
//                    myList.append(4)
//                    
//                    myList.removeFirstNodeOfValue(3)
//                    
//                    expect(myList.count).to(equal(3))
//                }
//                
//                it("Should return 0 for a cleared list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    myList.append(2)
//                    myList.append(3)
//                    myList.append(4)
//                    
//                    myList.clear()
//                    
//                    expect(myList.count).to(equal(0))
//                }
//            }
//            
//            context("contains tests") {
//                
//                it("Should return false for an empty list") {
//                    
//                    let myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    
//                    expect(myList.contains(0)).to(beFalse())
//                }
//                
//                it("Should return true for a single value list containing the value") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    
//                    expect(myList.contains(1)).to(beTrue())
//                }
//                
//                it("Should return false for a single value list containing the value") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    
//                    expect(myList.contains(2)).to(beFalse())
//                }
//                
//                it("Should return true for a multiple value list containing the value") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    myList.append(2)
//                    myList.append(3)
//                    myList.append(4)
//                    
//                    expect(myList.contains(4)).to(beTrue())
//                }
//                
//                it("Should return false for a multiple value list not containing the value") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    myList.append(2)
//                    myList.append(3)
//                    myList.append(4)
//                    
//                    expect(myList.contains(5)).to(beFalse())
//                }
//            }
//        }
//    }
//    
//    
//    //
//    // MARK: sequenceTypeTests
//    //
//    
//    func sequenceTypeTests() {
//        
//        describe("SequenceType tests") {
//            
//            context("Array from list") {
//                
//                it("Should create an empty array from an empty list") {
//                    
//                    let myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    let myArray = Array(myList)
//                    
//                    expect(myArray).to(beEmpty())
//                }
//                
//                it("Should create an array from a single value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    let myArray = Array(myList)
//                    
//                    expect(myArray).to(equal([1]))
//                }
//                
//                it("Should create an array from a multiple value list") {
//                    
//                    var myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>()
//                    myList.append(1)
//                    myList.append(2)
//                    myList.append(3)
//                    myList.append(4)
//                    
//                    let myArray = Array(myList)
//                    
//                    expect(myArray).to(equal([1, 2, 3, 4]))
//                }
//            }
//            
//            context("List from array") {
//                
//                it("Should create an empty list from an empty array") {
//                    
//                    let myArray: [Int] = []
//                    let myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>(myArray)
//                    
//                    expect(myList.isEmpty).to(beTrue())
//                }
//                
//                it("Should create a single value list from a single value array") {
//                    
//                    let myArray: [Int] = [1]
//                    let myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>(myArray)
//                    
//                    expect(myList.count).to(equal(1))
//                    expect(myList.firstValue).to(equal(1))
//                }
//                
//                it("Should create a proper list from a multiple value array") {
//                    
//                    let myArray: [Int] = [1, 2, 3, 4]
//                    let myList: GearDoublyLinkedList<Int> = GearDoublyLinkedList<Int>(myArray)
//                    
//                    expect(myList.count).to(equal(4))
//                    expect(myList.firstValue).to(equal(1))
//                    expect(myList.lastValue).to(equal(4))
//                }
//            }
//        }
//    }
//    
//    
//    //
//    // MARK: sequenceTypeTests
//    //
//    
//    func structTests() {
//        
//        describe("structTests") {
//            
//            context("Two lists, write to both and see that both copies are preserved") {
//                
//                it("Should have 2 distinct lists when writing to both references") {
//                    
//                    var myList: GearDoublyLinkedList<Int?> = GearDoublyLinkedList<Int?>()
//                    myList.append(1)
//                    myList.append(2)
//                    myList.append(nil)
//                    myList.append(4)
//                    
//                    var myList2 = myList
//                    myList2.append(99)
//                    
//                    let myArray = Array(myList)
//                    let myArray2 = Array(myList2)
//                    
//                    expect(myArray).to(equal([1,2,nil,4]))
//                    expect(myArray2).to(equal([1,2,nil,4,99]))
//                }
//            }
//            
//            context("Node not owned exception") {
//                
//                it("Should return an exception when processing a node from an unowned list") {
//                    
//                    var myList: GearDoublyLinkedList<Int?> = GearDoublyLinkedList<Int?>()
//                    myList.append(1)
//                    let node2 = myList.append(2)
//                    myList.append(nil)
//                    let node4 = myList.append(4)
//                    
//                    var myList2 = myList
//                    myList2.append(99)
//                    
//                    expect { try myList2.removeNode(node2) }.to(throwError())
//                    
//                    try! myList.removeNode(node4)
//                    
//                    expect(Array(myList)).to(equal([1,2,nil]))
//                }
//            }
//        }
//    }
//}
