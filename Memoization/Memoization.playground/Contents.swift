import Foundation

/*
 Memoization is a simple technique to reduce time complexity.
 */

func fibNaive(_ n: Int) -> Int {
    print(n)
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return fibNaive(n - 1) + fibNaive(n - 2)
    }
}

fibNaive(20) // 20 => 13s / 22 => 54s



// using memoization technique.

var memo = [Int: Int]()

func fib(_ n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    }
    
    if let result = memo[n] { return result }
    memo[n] = fib(n - 1) + fib(n - 2)
    return memo[n]!
}

fib(22) // 20 => 13s / 22 => 54s
