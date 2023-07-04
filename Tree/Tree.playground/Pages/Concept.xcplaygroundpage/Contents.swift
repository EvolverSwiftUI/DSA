import Foundation
import XCTest

// BST [ Binary Search Tree ]
class Node {
    var key: Int = 0
    var left: Node?
    var right: Node?
    
    init(_ key: Int) {
        self.key = key
    }
    
    var min: Node {
        if left == nil {
            return self
        } else {
            return left!.min
        }
    }
}

//let bst = BST()
//bst.insert(key: 5)
//bst.insert(key: 3)
//bst.insert(key: 2)
//bst.insert(key: 4)
//bst.insert(key: 7)
//bst.insert(key: 6)
//bst.insert(key: 8)
//
//bst.prettyPrint()


// Binary Search Tree
class BST {
    var root: Node?
    
    func insert(key: Int) {
        root = insertItem(root, key)
    }
    
    func delete(key: Int) {
        guard let _ = root else { return }
        root = delete(&root, key) // calling as PASS BY REFERENCE.
    }
    
    private func delete(_ node: inout Node?, _ key: Int) -> Node? {
        guard let nd = node else { return nil }
        
        if key < nd.key {
            nd.left = delete(&nd.left, key)
        } else if key > nd.key {
            nd.right = delete(&nd.right, key)
        } else {
            // Yahoo! Found you. This is the node we want to delete.
            
            // Case 1: No child
            if nd.left == nil && nd.right == nil {
                node = nil
            }
            
            // Case 2: One child
            else if nd.left == nil {
                node = nd.right
            }
            else if nd.right == nil {
                node = nd.left
            }
            
            // Case 3: Two children
            else {
                // Find the minimum node on the right (could also find max on left)
                let minRight = findMin(nd.right!)
                
                // Duplicte it by copying its value here
                node!.key = minRight.key
                
                // Now go ahead and delete the node we just duplicated (same key)
                node!.right = delete(&node!.right, node!.key)
            }
        }
        return nil
    }
    
    // insert 5 3 2 4 7 6 8
    private func insertItem(_ node: Node?, _ key: Int) -> Node {
        guard let node = node else {
            let node = Node(key)
            return node
        }
        
        if key < node.key {
            node.left = insertItem(node.left, key)
        } else if key > node.key {
            node.right = insertItem(node.right, key)
        }
        return node
    }
    
    func find(key: Int) -> Int? {
        guard let root = root else { return nil }
        guard let node = find(root, key) else { return nil }
        return node.key
    }
    
    private func find(_ node: Node?, _ key: Int) -> Node? {
        guard let node = node else { return nil }
        
        if node.key == key {
            return node
        } else if key < node.key {
            find(node.left, key)
        } else if key > node.key {
            find(node.right, key)
        }
        return nil
    }
    
    func findMin() -> Int {
        guard let root = root else { return 0 }
        return findMin(root).key;
    }

    private func findMin(_ node: Node) -> Node {
        return node.min;
    }

    func prettyPrint() {
        // Hard code print for tree depth = 3
        let rootLeftKey = root?.left == nil ? 0 : root?.left?.key
        let rootRightKey = root?.right == nil ? 0 : root?.right?.key
        
        var rootLeftLeftKey = 0
        var rootLeftRightKey = 0
        
        if root?.left != nil {
            rootLeftLeftKey = root?.left?.left == nil ? 0 : root?.left?.left?.key as! Int
            rootLeftRightKey = root?.left?.right == nil ? 0 : root?.left?.right?.key as! Int
        }
        
        var rootRightLeftKey = 0
        var rootRightRightKey = 0
        
        if root?.right != nil {
            rootRightLeftKey = root?.right?.left == nil ? 0 : root?.right?.left?.key as! Int
            rootRightRightKey = root?.right?.right == nil ? 0 : root?.right?.right?.key as! Int
        }
     
        let str = """
                      \(root!.key)
                    /  \\
                   \(rootLeftKey!)    \(rootRightKey!)
                  / \\  / \\
                 \(rootLeftLeftKey)  \(rootLeftRightKey) \(rootRightLeftKey)   \(rootRightRightKey)
        """

        print(str)
    }
    
    func printInOrderTraversal() {
        inOrderTraversal(node: root)
    }
    
    func inOrderTraversal(node: Node?) {
        guard let node = node else {
            print("reached end 5")
            return
        }
        print("1")
        inOrderTraversal(node: node.left)
        print("2")
        print("key: ",node.key)
        print("3")
        inOrderTraversal(node: node.right)
        print("4")
    }
}

let bst = BST()

func insert1() {
    bst.insert(key: 5)
    bst.insert(key: 3)
    bst.insert(key: 2)
    bst.insert(key: 4)
    bst.insert(key: 7)
    bst.insert(key: 6)
    bst.insert(key: 8)
    
    bst.prettyPrint()
    
    bst.printInOrderTraversal()
}


insert1()

/*

class BSTTests: XCTestCase {
    
    var bst: BST!
    
    override func setUp() {
        super.setUp()
        bst = BST()
    }
    
    func testInsert() {
        bst.insert(key: 5)
        bst.insert(key: 3)
        bst.insert(key: 2)
        bst.insert(key: 4)
        bst.insert(key: 7)
        bst.insert(key: 6)
        bst.insert(key: 8)
        
        bst.prettyPrint()
        
        XCTAssertNotNil(bst.find(key: 5))
        XCTAssertNotNil(bst.find(key: 3))
        XCTAssertNotNil(bst.find(key: 2))
        XCTAssertNotNil(bst.find(key: 4))
        XCTAssertNotNil(bst.find(key: 7))
        XCTAssertNotNil(bst.find(key: 6))
        XCTAssertNotNil(bst.find(key: 8))
    }
    
}


// Infrastructure for running unit tests

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
BSTTests.defaultTestSuite.run()

*/
