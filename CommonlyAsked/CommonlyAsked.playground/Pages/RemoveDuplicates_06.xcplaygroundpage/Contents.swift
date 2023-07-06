import Foundation

/*
 Challenge: Write a method that removes any duplicates from our Linked List.
*/


class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}


func printLinkedListSimple(_ head: Node?) {
    
    guard var node = head else { return }
    
    print(node.data)
    
    while node.next != nil {
        node = node.next!
        print(node.data)
    }
}

func removeDuplicates(_ head: Node?) {
    // Create a hash table or set to store the unique values.
    // Then delete the duplicate as soon as we detect it while walking the list.
    // Algorithm is O(n).

    var uniques = Set<Int>()
    var previous: Node?
    var current = head
    
    while current != nil {
        if uniques.contains(current!.data) {
            previous?.next = current?.next // skip this duplicate
        } else {
            uniques.insert(current!.data)
            previous = current
        }
        current = current?.next
    }
}


let node3 = Node(3)
let node2 = Node(2, node3)
let node1 = Node(1, node2)
node3.next = Node(1)        // duplicate
printLinkedListSimple(node1)
print("=======")
removeDuplicates(node1)
printLinkedListSimple(node1)
