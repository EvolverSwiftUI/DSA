import Foundation

/*
    Determine which elements intersect between two given arrays.
 */

// O(n^m) -> Quadratic
func intersectBrute(_ A: [Int], _ B: [Int]) -> [Int] {
    var result: [Int] = []
    
    for i in A {
        for j in B {
            if i == j {
                result.append(i)
            }
        }
    }
    
    return result
}

intersectBrute([1, 2, 4, 5, 6], [2, 3, 5, 7]) // [2, 5]


// O(n) -> Linear
func intersectByNSR(_ A: [Int], _ B: [Int]) -> [Int] {
    var result: [Int] = []
    
    for i in A {
        if B.contains(i) {
            result.append(i)
        }
    }
    
    return result
}

intersectByNSR([1, 2, 4, 5, 6], [2, 3, 5, 7]) // [2, 5]


func intersect(_ A: [Int], _ B: [Int]) -> [Int] {
    // create two pointers and loop through both arrays
    // if one element is less than the other...
    //   increment the lower pointer
    // if elements are equal collect
    // then increment either of the pointers

    var result: [Int] = []
    
    var i = 0
    var j = 0
    
    // O(n+m) -> Linear
    while i < A.count && j < B.count {
        if A[i] < B[j] {
            i += 1
        } else if B[j] < A[i] {
            j += 1
        } else {
            result.append(A[i])
            i += 1
        }
    }
    
    return result
}

intersect([1, 2, 4, 5, 6], [2, 3, 5, 7]) // [2, 5]
