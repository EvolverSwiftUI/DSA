import Foundation

/*
    Find merge point of two Lists. and return that node's data.
*/

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: Node?) -> Int {
    if head == nil {
        return 0
    }
    var len = 0
    var current = head
    while current != nil {
        len += 1
        current = current?.next
    }
    return len
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

// Brute Force Approach
// O(m*n) > O(n^2) ===> Quadratic Nature
func findMergeBrute(headA: Node?, headB: Node?) -> Int? {
    let n = length(headA)
    let m = length(headB)
    
    var currentA = headA
    var result: Int?
    
    for _ in 0...n-1 {
        if let A = currentA?.data {
            var currentB = headB
            for _ in 0...m-1 {
                if let B = currentB?.data {
                    print("A: \(A), B: \(B)")
                    if A == B {
                        result = A
                        return result
                    }
                }
                currentB = currentB?.next
            }
        }
        currentA = currentA?.next
    }
    
    return result
}

// Efficient Approach
// Trade-off Time for Space
// O(n) ===> Linear
func findMergeSpaceTime(headA: Node?, headB: Node?) -> Int? {
    var result: Int?
    let n = length(headA) // O(n)
    let m = length(headB) // O(m)
    
    var dict = [Int?: Bool]()
    var currentB = headB
    for _ in 0...m-1 { // O(m)
        let B = currentB?.data
        dict[B] = true
        currentB = currentB?.next
    }
    
    var currentA = headA
    for _ in 0...n-1 { // O(n)
        let A = currentA?.data
        if dict[A] == true {
            result = A
            return result
        }
        currentA = currentA?.next
    }
    
    return result
}

// O(n) ===> Linear
func findMergeInsight(headA: Node?, headB: Node?) -> Int? {
    var result: Int?
    
    let n = length(headA)
    let m = length(headB)

    var currentA = headA
    var currentB = headB

    if m > n {
        let temp = currentA
        currentA = currentB
        currentB = temp
    }
    
    let d = abs(n-m)
    
    for _ in 1...d {
        currentA = currentA?.next
    }
    
    for _ in 0...m-1 {
        let A = currentA?.data
        let B = currentB?.data
        if A == B {
            result = A
            return result
        }
        currentA = currentA?.next
        currentB = currentB?.next
    }
    
    return result
}

// 1 2 3 4 5 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

// 10 11 4 5 6
let node11 = Node(11, node4)
let node10 = Node(10, node11)

printLinkedListSimple(node1)
printLinkedListSimple(node10)

findMergeBrute(headA: node1, headB: node10)
findMergeSpaceTime(headA: node1, headB: node10)
findMergeInsight(headA: node1, headB: node10)
