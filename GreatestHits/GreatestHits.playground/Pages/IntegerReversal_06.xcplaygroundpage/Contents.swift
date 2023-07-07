import Foundation

/*
 Challenge:
 Given an int, reverse its digits.
 
 x = 123, return 321
 x= -123, return -321
 
*/

func reverseInt(_ x: Int) -> Int {
    var xVal = x
    let isNegartive = xVal < 0
    
    if isNegartive {
        xVal = abs(x)
    }

    var reverse = 0
    
    while xVal >= 1 {
        let lastDigit = xVal % 10 // get the lst digit
        xVal = xVal / 10 // drop the last digit
        reverse = reverse * 10 + lastDigit // shift every last digit by 10's position
    }
    
    return isNegartive ? (reverse * -1) : reverse
}

reverseInt(123)    // 321
reverseInt(-123)   // -321
