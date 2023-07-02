import Foundation

/*
 
 A = ["pim", "pom"]
 B = ["999999999", "777888999"]
 P = "88999"

 Search phrase P in B contcts and return either pim or pom from A.
 
 */

func solution(_ A: [String], _ B: [String], _ P: String) -> String {
    
    var result: [String] = []
    
    for i in 0..<B.count {
        if B[i].contains(P) {
            result.append(A[i])
        }
    }
    
    
    
    if result.count == 1 {
        return result.first!
    }
    
    if result.count > 1 {
        return result.sorted().first!
    }
    
    return "NO CONTACT"
}

let A = ["pim", "pom"]
let B = ["999999999", "777888999"]
let P = "88999"

solution(A, B, P) // pom
solution(["sander", "amy", "ann"], ["12345", "23456", "123"], "1")  // ann
solution(["ada", "eva", "leo"], ["1212", "1111", "4444"], "112")    // "NO CONTACT"

// edge cases
solution([String](), [String](), "")
solution(A, B, "")
