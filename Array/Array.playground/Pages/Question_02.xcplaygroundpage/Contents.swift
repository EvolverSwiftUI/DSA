import Foundation

/*
 after 3 chars sepate with "-". if not possible make 2 chars last 2 sets.
 Plz check below samples.
 */

func solution(_ S: String) -> String {
    let noSpace = S.replacingOccurrences(of: " ", with: "")
    let noSpaceNoDashes = noSpace.replacingOccurrences(of: "-", with: "")
    
    var res = ""
    var count = -2
    
    for char in noSpaceNoDashes {
        res.append(char)
        if count % 3 == 0 {
            res.append("-")
        }
        count += 1
    }
    
    if res.last == "-" {
        res = String(res.dropLast())
    }
    
    var chars = Array(res)
    let secondLastPointer = chars.count - 2
    if chars[secondLastPointer] == "-" {
        chars[secondLastPointer] = chars[secondLastPointer-1]
        chars[secondLastPointer-1] = "-"
    }
    res = String(chars)
    
    return res
}

solution("123456789")           // 123-456-789
solution("555372654")           // 555-372-654
solution("0 - 22 1985--324")    // 022-198-53-24


// edge cases
solution("01")                          // 01
solution("012")                         // 012
solution("0123")                        // 01-23
solution("0123        444")             // 012-34-44
solution("-------0123        444")      // 012-34-44




