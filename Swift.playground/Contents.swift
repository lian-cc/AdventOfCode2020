import UIKit

/*
 * Day 10: Adapter Array
 */

class Solution {
    
    func result(for input: String) -> Int {
        let data = parseInputData(input).sorted()
        return partTwoAnswer(for: data)
    }
    
    func partOneAnswer(for data: [Int]) -> Int {
        let differences = differences(for: data)
        let diff1 = differences.filter({ $0 == 1 }).count
        let diff3 = differences.filter({ $0 == 3 }).count
        return diff1 * diff3
    }
    
    func differences(for data: [Int]) -> [Int] {
        guard !data.isEmpty else {
            fatalError("Data is empty")
        }
        
        var data = data
        var previousNumber = 0
        
        var differences = [Int]()
        
        while !data.isEmpty {
            let number = data.removeFirst()
            let difference = number - previousNumber
            
            guard 1...3 ~= difference else {
                fatalError("Connection is broken")
            }
            
            differences.append(difference)
            previousNumber = number
        }
        
        differences.append(3)
        
        return differences
    }
    
    func partTwoAnswer(for data: [Int]) -> Int {
        guard !data.isEmpty else {
            fatalError("Data is empty")
        }
        
        let differences = differences(for: data)
        return countDistinctWays(forDifferences: differences)
    }
    
    let magicNumbers = [1, 2, 4, 7 ,13]
    
    func countDistinctWays(forDifferences differences: [Int]) -> Int {
        var data = differences
        var distinctWays: Int?
        var consecutiveTimes = 0
        
        while !data.isEmpty {
            let number = data.removeFirst()
            
            if number == 1 {
                consecutiveTimes += 1
            } else if number == 3 {
                guard consecutiveTimes > 0 else {
                    continue
                }
                
                let index = consecutiveTimes - 1
                
                guard index < magicNumbers.count else {
                    fatalError("Need magic number for continuous times: \(consecutiveTimes)")
                }
                
                let magicNumber = magicNumbers[index]
                
                if let base = distinctWays {
                    distinctWays = base * magicNumber
                } else if distinctWays == nil {
                    distinctWays = magicNumber
                }
                
                consecutiveTimes = 0
            }
        }
        
        guard let distinctWays = distinctWays else {
            fatalError("Did not find answer")
        }
        
        return distinctWays
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
