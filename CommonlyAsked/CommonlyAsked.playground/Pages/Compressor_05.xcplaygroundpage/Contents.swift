
import Foundation

// Challenge:
/*
  Give a string with repeating characters (i.e. "aaabb") write
  an algorithm that will compress the string down to the character, followed
  by the number of times it appears in the string (i.e "a3b2").
  If the compressed string is not smaller than original, return original.
*/

func compress(_ str: String) -> String {
    var compressed = ""
    var count = 0
    
    let sChars: [Character] = Array(str)
    
    for i in 0..<str.count {
        count += 1
        
        // If we are at the end of our string
        // or if next char different, append this result
        if i + 1 >= sChars.count || sChars[i] != sChars[i+1] {
            compressed.append(sChars[i])
            compressed.append(String(count))
            count = 0
        }
    }
    
    // Return the original string if shorter, or the compressed if longer
    return compressed.count < str.count ? compressed : str
}


compress("aaabb")           // a3b2
compress("aabb")            // aabb
compress("ab")              // ab
compress("abc")             // abc
compress("zzz")             // z3
compress("aabbaabb")        // aabbaabb (not shorter)
