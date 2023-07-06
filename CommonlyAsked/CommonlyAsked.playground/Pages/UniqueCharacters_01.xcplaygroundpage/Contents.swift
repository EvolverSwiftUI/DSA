import Foundation

/*
 Given a string. See if you can detect weather it contains only unique chars.
 */

func isUnique(_ text: String) -> Bool {
    var foundChars = [Character: Bool]()
    let chars: [Character] = Array(text)
    
    for char in chars {
        if foundChars[char] != nil { // alredy found
            return false
        }
        foundChars[char] = true
    }
    
    return true
}

isUnique("ab")
isUnique("aa")
isUnique("abcdefghijklmonpqrstuvwxyz")
