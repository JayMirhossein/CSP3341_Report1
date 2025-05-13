/* This Swift program defines four long-running tasks (taskA, taskB, taskC, and taskD), 
each of which prints a message every second for 1 hour (3600 seconds). It also 
demonstrates basic use of concurrency using DispatchQueue.
 
 Mirhossein (Jay) ZIABARI
 U65, B.S Computer Science
 -----------------------------------
 10483250
 mjalalim@our.ecu.edu.au */


import Foundation

func taskA() {
    for taskA_counter in 1...3600 {
        print("🔵 Task A - \(taskA_counter)")
        sleep(1)
    }
}

func taskB() {
    for taskB_counter in 1...3600 {
        print("🟢 Task B - \(taskB_counter)")
        sleep(1)
    }
}

func taskC() {
    for i in stride(from: 1, to: 3600, by: 2) {
      print("\u{001B}[0;31m  Task C - \(i)")
        sleep(1)

    }
    
}

// Function to count even numbers concurrently from 1 to 1000
func taskD() {
    for i in stride(from: 0, to: 3600, by: 2) {
        print("\u{001B}[0;33m  Task D - \(i)")
        sleep(1)
    }
}


DispatchQueue.global().async {
    taskA()
}

DispatchQueue.global().async {
    taskC()
}
DispatchQueue.global().async {
    taskB()
}

DispatchQueue.global().async {
    taskD()
}


// Keep the main thread alive
RunLoop.main.run()
