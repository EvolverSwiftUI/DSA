import Foundation

// Detect a cycle in LinkedList?

class Node {
    var data: Int
    weak var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func printLinkedListSimple(_ head: Node?) {
    if head == nil { return }
    
    var result = [Int]()
    guard var node = head else { return }
    result.append(node.data)
    
    while node.next != nil {
        guard let nextNode = node.next else { return }
        node = nextNode
        result.append(node.data)
    }
    print(result)
}

func hasCycle(first: Node?) -> Bool? {
    var slow: Node? = first
    var fast: Node? = first
    
    while slow?.next != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow?.data == fast?.data {
            return true
        }
    }
    
    return false
}

let node5 = Node(5)
let node4 = Node(4)
let node3 = Node(3)
let node2 = Node(2)
let head = Node(1)

head.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node3
//printLinkedListSimple(head)

guard let output = hasCycle(first: head) else { fatalError() }
print(output)
