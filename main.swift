import Foundation

// Function to print numbers from a start to an end
func printNumbersA(from start: Int, to end: Int) {
    for numberA in start...end {
        print("\u{001B}[0;33m channel A: \(numberA)")
    }
}

func printNumbersB(from start: Int, to end: Int) {
    for numberB in start...end {
        print("\u{001B}[0;31m channel B: \(numberB)")
    }
}

// Create two dispatch queues for concurrent execution
let queue1 = DispatchQueue(label: "com.example.queue1", attributes: .concurrent)
let queue2 = DispatchQueue(label: "com.example.queue2", attributes: .concurrent)


// Start time
var startTime = Date()

// Dispatch tasks to the queues concurrently
queue1.async {
    printNumbersA(from: 1, to: 500)
}

queue2.async {
    printNumbersB(from: 501, to: 1000)
}

// Wait for all tasks to finish before exiting
DispatchQueue.global().async {
    // Sleep for a while to allow other queues to finish
    Thread.sleep(forTimeInterval: 1)
}

// End time
var endTime = Date()

let executionTime1 = endTime.timeIntervalSince(startTime)
print("Execution time 1: \(executionTime1) seconds")
