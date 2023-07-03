import Foundation

/*
 Reverse string.
 abc => cba.
 */

func solution(_ text: String) -> String {
    var chars: [Character] = Array(text) // String to array of Chars.
    
    // Create a stack
    var result: [Character] = []
    
    // Push chars
    for char in chars {
        result.append(char)
    }
    
    // Pop chars
    for i in result.indices {
        chars[i] = result.popLast()! // removes and return last item
    }
    
    return String(chars) // array of Chars to String.
}

solution("abc")
solution("Would  you like to play a game?")
