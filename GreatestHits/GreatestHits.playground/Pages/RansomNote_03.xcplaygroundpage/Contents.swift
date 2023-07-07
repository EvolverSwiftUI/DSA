import Foundation

/*
    Challenge: Write a ransom note by cutting letters out of the available
    magazines and pasting them together to form a letter. Given an arbitrary
    ransom note string and another string containing all the contents of all
    the magazines, write a function that will return true if the ransom
    note can be made from the magazines; otherwise, it will return false.
    Every letter found in the magazine string can only be used once in your
    ransom note.

    Assumption: We don't need to count spaces in our note



    This is basically an exercise in counting and book keeping.

    If we can count the number of times a letter appears in the ransom note,
    and then compare it with the number of times it appears in the letters,
    we can tell if the ransom note can be written.
*/

func canWrite(note: String, letters: String) -> Bool {
    
    let noteNoSpace = note.replacingOccurrences(of: " ", with: "")
    //print(noteNoSpace)

    let mappedNote: [Character: Int] = map(noteNoSpace)
    //print(mappedNote)
    let mappedLetter: [Character: Int] = map(letters)
    //print(mappedLetter)
    
    for (key, _) in mappedNote {
        if mappedLetter[key] != nil {
            return false
        }
        
        let noteCount = mappedNote[key]!
        let letterCount = mappedLetter[key]!
        
        if letterCount < noteCount {
            return false
        }
    }

    return true
}

func map(_ str: String) -> [Character: Int] {
    var mappedDict: [Character: Int] = [:]
    var sChars: [Character] = Array(str)
    
    for char in sChars {
        if mappedDict[char] != nil {
            mappedDict[char] = mappedDict[char]! + 1
        } else {
            mappedDict[char] = 1
        }
    }
    
    return mappedDict
}

canWrite(note: "Pay", letters: "yaP")
canWrite(note: "Pay", letters: "yaP a")
canWrite(note: "Pay me $1000", letters: "ayPem0001$")
canWrite(note: "Pay", letters: "Pa")
