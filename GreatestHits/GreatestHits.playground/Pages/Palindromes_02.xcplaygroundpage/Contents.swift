import Foundation

/*
  Challenge: Detect if a given string is a palindrome.
  A palindrome is a word that can be spelt the same way forwards and backwards.
 */

func isPalindrome(_ str: String) -> Bool {
    
    let sChars: [Character] = Array(str)
    let length = sChars.count
    
    for i in 0..<sChars.count-1 {
        if sChars[i] != sChars[sChars.count-i-1] {
            return false
        }
    }
    
    return true
}


isPalindrome("abba")
isPalindrome("mom")
isPalindrome("dad")
isPalindrome("radar")
isPalindrome("rush")
isPalindrome("yes")

// If your interviewer is OK, you could also do this.
// But best to know above trick in case they want you to do manually.
func isPalindromeSimple(_ value: String) -> Bool {
    return value == String(value.reversed())
}
