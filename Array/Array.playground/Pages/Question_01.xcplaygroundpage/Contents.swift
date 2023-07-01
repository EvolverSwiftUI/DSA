import Foundation

/**
 
Tips for solving

 1. Start Brute Force
 2. Use Paper
 3. Handle Edge Cases
 4. Optimize After
 
 */

// rotate an array 3 times
// input  [3,8,9,7,6]
// output [9,7,6,3,8]

func solution(A: [Int], K: Int) -> [Int] {
    // edge cases
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    for _ in 1...K {
        result = rotateRightOnce(A: result)
    }
    return result
}

func rotateRightOnce(A: [Int]) -> [Int] {
    var newArray = Array<Int>(repeating: 0, count: A.count)
    for i in 0..<A.count-1 {
        newArray[i+1] = A[i]
    }
    newArray[0] = A.last!
    return newArray
}

var input = [3,8,9,7,6]
var input1 = [1,2,3,4,5]
var rotateCount = 3

solution(A: input, K: 1)
solution(A: input, K: 2)
solution(A: input, K: 3)

//rotateRightOnce(A: input1)
