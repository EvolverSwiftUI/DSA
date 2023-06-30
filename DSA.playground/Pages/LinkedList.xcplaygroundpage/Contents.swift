

// Linked List
// Documentation:
// https://docs.google.com/document/d/1A7AHzHNw5bcFOUzCHPAUVgx0lPKz2vBm-ouE0bR4cDs/edit
 

import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

let node3 = Node(3) // Tail
let node2 = Node(2, node3) // Node
let node1 = Node(1, node2) // Head

// here we have linked list like 1 pointing to 2 and 2 pointing to 3
// 1 → 2 → 3

// We can print them out by walking the list
func printLinkedListSimple(_ head: Node?) {
    if head == nil { return }
    
    guard var node = head else { return }
    print(node.data)
    
    while node.next != nil {
        guard let nextNode = node.next else { return }
        node = nextNode
        print(node.data)
    }
}

// printLinkedListSimple(node1)

class LinkedList {
    private var head: Node?
    
    // O(1)
    func addFront(_ data: Int) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }
    
    // O(1)
    func getFirst() -> Int? {
        if head == nil {
            return nil
        }
        
        return head?.data
    }
    
    // O(n)
    func addBack(_ data: Int) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head!
        while node.next != nil {
            node = node.next!
        }
        node.next = newNode
    }
    
    // O(n)
    func getLast() -> Int? {
        if head == nil {
            return nil
        }
        
        var node = head!
        while node.next != nil {
            node = node.next!
        }
        
        return node.data
    }
    
    // O(n)
    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        
        let newNode = Node(data)
        var currentNode = head!
        
        for _ in 0..<position-1 {
            currentNode = currentNode.next!
        }
        newNode.next = currentNode.next
        currentNode.next = newNode
    }
    
    // O(1)
    func deleteFirst() {
        head = head?.next
    }
    
    // O(n)
    func deleteLast() {
        if head == nil {
            return
        }
        
        var currentNode = head
        var previousNode: Node?
        
        while currentNode?.next != nil {
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        previousNode?.next = nil
    }
    
    // O(n)
    func delete(at position: Int) {
        if position == 0 {
            deleteFirst()
            return
        }
        
        var currentNode = head
        var previousNode: Node?
        
        for _ in 0..<position-1 {
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        previousNode?.next = currentNode?.next
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func clear() {
        head = nil
    }
    
    func printLinkedList() {
        if head == nil { return }
        
        var result = [Int]()
        var node = head
        result.append(node!.data)
        
        while node?.next != nil {
            node = node?.next
            result.append(node!.data)
        }
        
        print(result)
    }
}


let linkedList = LinkedList()
linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)
linkedList.printLinkedList()

linkedList.addFront(4)
linkedList.printLinkedList()

linkedList.addBack(5)
linkedList.printLinkedList()
guard let lastItem = linkedList.getLast() else {
    fatalError("No item found.")
}
print(lastItem)

linkedList.insert(position: 2, data: 6)
linkedList.printLinkedList()

linkedList.deleteFirst()
linkedList.printLinkedList()

linkedList.delete(at: 2)
linkedList.printLinkedList()

linkedList.isEmpty
linkedList.printLinkedList()

linkedList.clear()
linkedList.printLinkedList()
linkedList.isEmpty

linkedList.addFront(7)
linkedList.printLinkedList()
