import UIKit

/*
 * Day 9: Encoding Error
 */

class Solution {
    
    let preambleCount = 25
    
    func result(for input: String) -> Int {
        let numbers = parseInputData(input)
        let number = invalidNumber(in: numbers)
        return sumOfTwoNumbersInContiguousSet(for: number, in: numbers)
    }
    
    func invalidNumber(in numbers: [Int]) -> Int {
        var numbers = numbers
        var queue = [Int]()
        
        guard numbers.count > preambleCount else {
            fatalError("Data does not have enough preamble")
        }
        
        for _ in 0 ..< preambleCount {
            queue.append(numbers.removeFirst())
        }
        
        while let number = numbers.first {
            if validNumber(number, for: queue) {
                queue.removeFirst()
                queue.append(numbers.removeFirst())
                continue
            }
            return number
        }
        
        fatalError("No answer")
    }
    
    func validNumber(_ number: Int, for preamble: [Int]) -> Bool {
        var queue = preamble
        
        while let x = queue.first {
            queue.removeFirst()
            for y in queue {
                guard x + y == number else {
                    continue
                }
                return true
            }
        }
        
        return false
    }
    
    func sumOfTwoNumbersInContiguousSet(for number: Int, in numbers: [Int]) -> Int {
        guard
            let contiguousSet = contiguousSet(for: number, in: numbers)?.sorted(),
            let smallestNumber = contiguousSet.first,
            let largestNumber = contiguousSet.last
        else {
            fatalError("No answer")
        }
        return smallestNumber + largestNumber
    }
    
    func contiguousSet(for goal: Int, in list: [Int]) -> [Int]? {
        var list = list
        var queue = [Int]()
        var sum = 0
        
        while let number = list.first {
            queue.append(list.removeFirst())
            sum += number
            
            if sum == goal {
                guard queue.count > 1 else {
                    sum -= queue.removeFirst()
                    continue
                }
                return queue
            }
            
            while sum >= goal {
                sum -= queue.removeFirst()
                guard sum == goal, queue.count > 1 else {
                    continue
                }
                return queue
            }
        }
            
        return nil
    }
    
    func parseInputData(_ data: String) -> [Int] {
        let components = data.components(separatedBy: CharacterSet.newlines).filter { $0.count > 0 }
        return components.map { component in
            guard let rowData = Int(component) else {
                fatalError("Unknown data: \(component)")
            }
            return rowData
        }
    }
}

let sol = Solution()
let input: String

do {
    guard let path = Bundle.main.path(forResource: "input", ofType: "txt") else {
        fatalError("Path for input.txt is not found")
    }
    input = try String(contentsOfFile: path)
} catch {
    fatalError(error.localizedDescription)
}

print(sol.result(for: input))
