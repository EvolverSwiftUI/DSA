import Foundation

/*
 Given two strings., check if one is a permutation of the other.
 */

func isPermutation(_ text: String, _ perm: String) -> Bool {
    if text.count != perm.count {
        return false
    }
    
    return text.sorted() == perm.sorted()
}

isPermutation("abc", "cba")
isPermutation("abc", "xyz")
