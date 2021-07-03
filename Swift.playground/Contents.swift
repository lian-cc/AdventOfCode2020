import UIKit

/*
 * Day 10: Adapter Array
 */

class Solution {
    
    func result(for input: String) -> Int {
        let data = parseInputData(input).sorted()
        return partOneAnswer(for: data)
    }
    
    func partOneAnswer(for data: [Int]) -> Int {
        let difference = countDifference(for: data)
        guard
            let diff1 = difference[1],
            let diff3 = difference[3]
        else {
            fatalError("Count difference error")
        }
        return diff1 * diff3
    }
    
    func countDifference(for data: [Int]) -> [Int: Int] {
        guard !data.isEmpty else {
            fatalError("Data is empty")
        }
        
        var count = [
            1: 0,
            2: 0,
            3: 0,
        ]
        
        var data = data
        var previousNumber = 0
        
        while !data.isEmpty {
            let number = data.removeFirst()
            let difference = number - previousNumber
            
            guard count.keys.contains(difference) else {
                fatalError("Connection is broken")
            }
            
            count[difference]! += 1
            previousNumber = number
        }
        
        count[3]! += 1
        
        return count
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
