import Foundation

// BST [ Binary Search Tree ]
class Node {
    var key: Int = 0
    var left: Node?
    var right: Node?
    
    init(_ key: Int) {
        self.key = key
    }
}

let bst = BST()
bst.insert(key: 5)
bst.insert(key: 3)
bst.insert(key: 2)
bst.insert(key: 4)
bst.insert(key: 7)
bst.insert(key: 6)
bst.insert(key: 8)

bst.prettyPrint()


// Binary Search Tree
class BST {
    var root: Node?
    
    func insert(key: Int) {
        root = insertItem(root, key)
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
    
    func prettyPrint() {
         
    }
}
