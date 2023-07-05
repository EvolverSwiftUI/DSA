
/*
     Check weather the given tree is binary search tree?
 */

import Foundation
import XCTest


class Node {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(_ key: Int, left: Node? = nil, right: Node? = nil) {
        self.key = key
        self.left = left
        self.right = right
    }
}


func checkBST(root: Node?) -> Bool {
    return isBST(root, nil, nil)
}

private func isBST(_ node: Node?, _ min: Int?, _ max: Int?) -> Bool {
    guard let node = node else {
        return true
    }
    
    if let min = min, node.key <= min {
        print("min: \(min) key: \(node.key)")
        return false
    }
    
    if let max = max, node.key >= max {
        print("max: \(max) key: \(node.key)")
        return false
    }
    
//    if min max OK. go to next level passing in min/max and parent
    return isBST(node.left, min, node.key) && isBST(node.right, node.key, max)
}

class Tests: XCTestCase {
    
    func testIsValid1() {
        let root = Node(4)
        root.left = Node(2)
        root.right = Node(6)
        root.left?.left = Node(1)
        root.left?.right = Node(3)
        root.right?.left = Node(5)
        root.right?.right = Node(7)

        XCTAssertTrue(checkBST(root: root))
    }
    
    func testIsNotValid1() {
        let root = Node(3)
        root.left = Node(2)
        root.right = Node(4)
        root.left?.left = Node(1)
        root.right?.left = Node(5)
        root.right?.right = Node(6)

        XCTAssertFalse(checkBST(root: root))
    }

    func testIsNotValidDuplicate1() {
        let root = Node(3)
        root.left = Node(2)
        root.right = Node(5)
        root.left?.left = Node(1)
        root.right?.left = Node(6)
        root.right?.right = Node(1)

        XCTAssertFalse(checkBST(root: root))
    }
}

// Infrastructure
class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}
let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
Tests.defaultTestSuite.run()
