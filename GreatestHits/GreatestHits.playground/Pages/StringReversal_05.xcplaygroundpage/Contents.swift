import Foundation

/*
  Challenge: Given a string, return it's reverse.
  "abc" => "cba"
 */

func reverseStr(_ text: String) -> String {
    
    var sChars: [Character] = Array(text)
    
    // Initialize pointers
    var left = 0
    var right = text.count - 1
    
    // Loop through swapping left and right until we hit the middle
    for _ in 0..<text.count / 2  {
        let temp = sChars[left]
        sChars[left] = sChars[right]
        sChars[right] = temp
        
        left += 1
        right -= 1
    }
    
    return String(sChars)
}

reverseStr("Hello")    // olleH
reverseStr("Sam")      // maS
reverseStr("It's been a long time.") // .emit gnol a neeb s'tI

String("Hello".reversed())
