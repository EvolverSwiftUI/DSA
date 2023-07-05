import Foundation

// works on principle ->
// compare each number with others and then bubble up to last in the order.

// O(n^2) ===> among three this is slowest.

class BubbleSort {
    func sort(_ array: [Int]) -> [Int] {
        var arr = array
        let n = arr.count
        for i in 0..<n-1 {
            for j in 0..<n-i-1 {
                if arr[j] > arr[j+1] {
                    // swap
                    let temp = arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = temp
                }
            }
        }
        return arr
    }
}

let bubbleSort = BubbleSort()
bubbleSort.sort([5,4,3,2,1])
