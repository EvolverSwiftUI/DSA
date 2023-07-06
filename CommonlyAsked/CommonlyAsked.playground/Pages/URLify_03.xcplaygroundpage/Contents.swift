import Foundation

/*
    Given a string, replace all the spaces with the ASCII symbol for space of "%20".
*/


func urlify(_ url: String, length: Int) -> String {
    // Create a bucket to hold our final result
    var result: [Character] = Array<Character>(repeating: " ", count: length)
    
    // Strip off any space at beginning or end
    let url = url.trimmingCharacters(in: .whitespacesAndNewlines)
    
    // Loop through url, and insert an ASCII space '%20' whenever we hit a space
    let urlChars: [Character] = Array(url)
    
    // Also create a pointer to keep track of where we are in our results array
    var pointer = 0

    for i in 0..<urlChars.count {
        if urlChars[i] != " " {
            result[pointer] = urlChars[i]
            pointer += 1
        } else {
            result[pointer] = "%"
            result[pointer+1] = "2"
            result[pointer+2] = "0"
            pointer += 3
        }
    }
    
    return String(result)
}

urlify("My Home Page    ", length: 16) // "My%20Home%20Page"
