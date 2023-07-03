import Foundation

/*
 Balanced Brackets.
*/

func isBalanced(s: String) -> String {
    
    // stack of chars
    var chars: [Character] = [] // init of stack
    
    for char in s {
        switch char {
        case "{", "[", "(":
            chars.append(char) // push
        case "}":
            if chars.isEmpty || chars.last != "{" {
                return "NO"
            }
            chars.popLast() // pop
        case "]":
            if chars.isEmpty || chars.last != "[" {
                return "NO"
            }
            chars.popLast() // pop
        case ")":
            if chars.isEmpty || chars.last != "(" {
                return "NO"
            }
            chars.popLast() // pop
        default:
            print("breaking \(char)")
        }
    }
    
    return chars.isEmpty ? "YES" : "NO"
}

isBalanced(s: "[{()}]")
isBalanced(s: "[{)}]")
