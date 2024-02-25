import UIKit

var result: Int = 0

func increment() {
    result = result + 1
}

func decrement() {
    result = result - 1
}

let firstConcurrentQueue = DispatchQueue(label: "ru.sergeipanov.first-concurrent-queue", attributes: .concurrent)
let secondConcurrentQueue = DispatchQueue(label: "ru.sergeipanov.second-concurrent-queue", attributes: .concurrent)

let group = DispatchGroup()

for _ in 1...100 {
    firstConcurrentQueue.async(group: group, execute: increment)
    secondConcurrentQueue.async(group: group, execute: decrement)
}

group.notify(queue: DispatchQueue.main) {
    print(result)
}

RunLoop().run()
