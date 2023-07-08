import Foundation
/*
 Write, in code, how one could represent the node of a binary tree.
 */

class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.data = data
    }
}
