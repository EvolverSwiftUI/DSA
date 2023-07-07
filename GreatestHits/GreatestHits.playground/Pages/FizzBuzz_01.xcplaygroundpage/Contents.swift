import Foundation

/*
 
  Challenge: Write a program that prints 1 to 100.
  But for multiples of three print 'Fizz' instead of the number.
  And for multiples of five  print 'Buzz'.
  For numbers which are multiples of both three and five print 'FizzBuzz'.
 
  Example
     1
     2
     Fizz
     4
     Buzz
     ...
     14
     FizzBuzz

 */

func fizzBuzz() {
    for i in 1..<101 {
        if i % 3 == 0 && i % 5 == 0 {
            print("FizzBuzz")
        } else if i % 3 == 0 {
            print("Fizz")
        } else if i % 5 == 0 {
            print("Buzz")
        } else {
            print(i)
        }
    }
}

fizzBuzz()
