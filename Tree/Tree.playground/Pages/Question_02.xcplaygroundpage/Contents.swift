import Foundation
import XCTest

/*
    Find the Tree Height
*/


class Node {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(_ key: Int) {
        self.key = key
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    func height() -> Int {
        if isLeaf {
            return 0
        } else {
            print("left: \(left?.height() ?? 0) right: \(right?.height() ?? 0)")
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
}

let root = Node(20)
root.left = Node(8)
root.right = Node(22)
root.left?.left = Node(4)
root.left?.right = Node(12)
root.left?.right?.left = Node(10)
root.left?.right?.right = Node(14)

root.height()


class Tests: XCTestCase {

    func testHeightOfZero() {
        let root = Node(5)
        XCTAssertEqual(0, root.height())
    }

    func testHeightOfTwo() {
        let root = Node(5)
        root.left = Node(3)
        root.right = Node(10)
        root.left?.left = Node(20)
        root.left?.right = Node(21)
        root.right?.left = Node(1)

        XCTAssertEqual(2, root.height())
    }
    
    func testHeightOfThree() {
        let tree = Node(20)
        tree.left = Node(8)
        tree.right = Node(22)
        tree.left?.left = Node(4)
        tree.left?.right = Node(12)
        tree.left?.right?.left = Node(10)
        tree.left?.right?.right = Node(14)

        XCTAssertEqual(3, tree.height())
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
