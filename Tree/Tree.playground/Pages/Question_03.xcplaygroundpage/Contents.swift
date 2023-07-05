import Foundation

/*
   Find the Lowest Common Ancestor(LCA)?
 */

class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.data = data
    }
}

class BinaryTree {
    var root: Node?
    
    func lca(_ node: Node?, _ n1: Int, _ n2: Int) -> Node? {
        guard let node = node else { return nil }
        
        // If both n1 and n2 are smaller than root, then LCA lies in left
        if node.data > n1 && node.data > n2 {
            return lca(node.left, n1, n2)
        }
        
        // If both n1 and n2 are grater than root, then LCA lies in right
        if node.data < n1 && node.data < n2 {
            return lca(node.right, n1, n2)
        }

        // Else we are at the node which is the LCA
        return node
    }
}

// Step 1: Build the BST
let tree = BinaryTree()
tree.root = Node(20)
tree.root?.left = Node(8)
tree.root?.right = Node(22)
tree.root?.left?.left = Node(4)
tree.root?.left?.right = Node(12)
tree.root?.left?.right?.left = Node(10)
tree.root?.left?.right?.right = Node(14)

// Step 2: Make it pass these test cases
var n1 = 10, n2 = 14
var t = tree.lca(tree.root, n1, n2)
print("LCA of \(n1) and \(n2) is \(String(describing: t?.data ?? -1))") // 12

n1 = 14; n2 = 8
t = tree.lca(tree.root, n1, n2)
print("LCA of \(n1) and \(n2) is \(String(describing: t?.data ?? -1))") // 8

n1 = 10; n2 = 22
t = tree.lca(tree.root, n1, n2)
print("LCA of \(n1) and \(n2) is \(String(describing: t?.data ?? -1))") // 20
