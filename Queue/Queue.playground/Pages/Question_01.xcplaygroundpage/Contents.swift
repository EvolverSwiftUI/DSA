import Foundation


/*
 Rotate array A rightside K times and return array
 */

// input:
// A = [3,8,9,7,6]
// K = 3

// output:
// A = [9,7,6,3,8]

func rotateQueueRight(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }

    var result = A
    
    for _ in 1...K {
        let last = result.last!
        result.insert(last, at: 0)
        result.remove(at: A.count)
    }
    
    return result
}

rotateQueueRight(A: [1,2,3,4,5], K: 1)
rotateQueueRight(A: [1,2,3,4,5], K: 2)
rotateQueueRight(A: [1,2,3,4,5], K: 3)

rotateQueueRight(A: [3,8,9,7,6], K: 3)


// input:
// A = [3,8,9,7,6]
// K = 3

// output:
// A = [7,6,3,8,9]

func rotateQueueLeft(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    
    for _ in 1...K {
        let first = result.first!
        result.append(first)
        result.remove(at: 0)
    }
    
    return result
}

rotateQueueLeft(A: [1,2,3,4,5], K: 1)
rotateQueueLeft(A: [1,2,3,4,5], K: 2)
rotateQueueLeft(A: [1,2,3,4,5], K: 3)

rotateQueueLeft(A: [3,8,9,7,6], K: 3)
