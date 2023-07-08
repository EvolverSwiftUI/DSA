import Foundation

/*
 https://www.youtube.com/watch?v=XKu_SEDAykw&ab_channel=LifeatGoogle
 
 Given a set of numbers, determine if there is a pair that equals a given sum.
*/


func hasPairWithSumBrute(_ data: [Int], _ sum: Int) -> Bool {
    
    // progressively walk - O(n^2)
    for i in 0..<data.count {
        for j in i+1..<data.count {
            if data[i] + data[j] == sum {
                return true
            }
        }
    }
    
    return false
}

hasPairWithSumBrute([1, 2, 4, 9], 8)     // false
hasPairWithSumBrute([1, 2, 4, 4], 8)     // true
hasPairWithSumBrute([1, 2, 4], 8)        // false



// best approach with O(n) TC.
func hasPairWithSum(_ data: [Int], _ sum: Int) -> Bool {
    // Store the complement in a Set
    var complement = Set<Int>()
    
    for i in data { // O(n)
        // is it contains the complement value
        if complement.contains(i) {
            return true
        }
        // its not have complement value
        // so insert its compleemnt here.
        complement.insert(sum-i)
    }
    
    return false
}

hasPairWithSum([1, 2, 4, 9], 8)     // false
hasPairWithSum([1, 2, 4, 4], 8)     // true
hasPairWithSum([1, 2, 4], 8)        // false
