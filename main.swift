
import Foundation
var i: Int
var j:Int


// Function to count odd numbers concurrently from 1 to 1000
func countOdd() async {
    for i in stride(from: 1, to: 5000, by: 2) {
      // print("\u{001B}[0;31m Odd: \(i)", terminator: " ")

    }
}

// Function to count even numbers concurrently from 1 to 1000
func countEven() async {
    for i in stride(from: 1, to: 5000, by: 2) {
     print("\"\u{001B}[0;33m Even: \(i)", terminator: " ")
    }
}

// Calling the functions concurrently
Task {
    //async let oddTask = countOdd()
   // async let evenTask = countEven()
    
    async let oddTask: () = countOdd()
    async let evenTask: () = countEven()
    
    // Start time
    var startTime = Date()

    // Wait for both tasks to finish
    await oddTask
    await evenTask
    
    // End time
    var endTime = Date()

    
    // Calculate the time interval
    let executionTime1 = endTime.timeIntervalSince(startTime)

  
    startTime = Date()
    
    for i in stride(from: 1, to: 5000, by: 2) {
    print("\u{001B}[0;31m Odd: \(i)",terminator: " ")
    }
    
    for i in stride(from: 2, to: 5000, by: 2) {
     print("\"\u{001B}[0;33m Even: \(i)",terminator: " ")
    }
    
    endTime = Date()
    let executionTime2 = endTime.timeIntervalSince(startTime)
    print("Execution time 1: \(executionTime1) seconds")
    print("Execution time 2: \(executionTime2) seconds")

}

