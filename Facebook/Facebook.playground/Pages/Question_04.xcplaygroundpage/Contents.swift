import Foundation
import XCTest

/*
    InOrder Traversal of a Given Binary Tree.
*/

class Node {
    
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.data = data
    }
    
    func copy() -> Node {
        let newNode = Node(data)
        if let left = left {
            newNode.left = left.copy()
        }
        if let right = right {
            newNode.right = right.copy()
        }
        return newNode
    }
    
    func inOrderTraversal(node: Node?) {
        // L
        // Root
        // R
        guard let node = node else { return }
        inOrderTraversal(node: node.left) // L
        print(node.data) // root          // Root
        inOrderTraversal(node: node.right)// R
    }
}



class Tests: XCTestCase {

    func testCopy() {
        //          1
        //         / \
        //        2   3
        let node1 = Node(1)
        let node2 = Node(2)
        let node3 = Node(3)
        node1.left = node2
        node1.right = node3
        
        let newCopy = node1.copy()
        XCTAssertEqual(newCopy.data, node1.data)
        XCTAssertEqual(newCopy.left!.data, node1.left!.data)
        XCTAssertEqual(newCopy.right!.data, node1.right!.data)
        
        // print nodes inorder traversal
        newCopy.inOrderTraversal(node: newCopy)
    }
    
    func testDeepCopy() {
        //          5
        //         / \
        //        3   7
        //       / \  /\
        //      2  4 6  8
        let node5 = Node(5)
        let node3 = Node(3)
        let node7 = Node(7)
        let node2 = Node(2)
        let node4 = Node(4)
        let node6 = Node(6)
        let node8 = Node(8)
        
        node5.left = node3
        node5.right = node7
        
        node3.left = node2
        node3.right = node4
        
        node7.left = node6
        node7.right = node8
        
        let newCopy = node5.copy()
        XCTAssertEqual(newCopy.data, node5.data)
        XCTAssertEqual(newCopy.left!.data, node5.left!.data)
        XCTAssertEqual(newCopy.right!.data, node5.right!.data)
        
        // Modify 7 to point to 9 instead of 8
        let node9 = Node(9)
        node7.right = node9
        
        // Copy should still point to old value - 8
        XCTAssertEqual(newCopy.right!.right!.data, 8)
        
        // print nodes inorder traversal
        newCopy.inOrderTraversal(node: newCopy)
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
