import Foundation

/*
 
Challenge:
 T1 is a large binary tree and T2 is a smaller one.
 Write an algorithm to determine if T2 is a subtree of T1.

Root:
               5
             3   7
            2 4 6 8

Subtree:
               7
              6 8

*/

class Node {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.key = data
    }
}

func isSubTree(_ tree: Node, _ subTree: Node) -> Bool {
    let rootOrder = getOrder(root)
    let subTreeOrder = getOrder(subTree)
    return rootOrder.contains(subTreeOrder)
}

func getOrder(_ root: Node?) -> String {
    var result = ""
    preOrderTraversal(root, result: &result)
    return result
}

func preOrderTraversal(_ node: Node?, result: inout String) {
    guard let node = node else { return }
    result.append(String(node.key)) // root
    preOrderTraversal(node.left, result: &result)
    preOrderTraversal(node.right, result: &result)
}


let root = Node(8)
root.left = Node(3)
root.right = Node(7)
root.left?.left = Node(2)
root.left?.right = Node(4)
root.right?.left = Node(6)
root.right?.right = Node(8)

let subTree = Node(7)
subTree.left = Node(6)
subTree.right = Node(8)


isSubTree(root, subTree)
