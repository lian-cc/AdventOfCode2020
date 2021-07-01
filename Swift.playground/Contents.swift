import UIKit

/*
 * Day 8: Handheld Halting
 */

class Solution {
    
    enum Operation: String {
        case accumulator = "acc"
        case jumps = "jmp"
        case noOperation = "nop"
    }
    
    struct Instruction {
        let operation: Operation
        let argument: Int
    }
    
    func result(for input: String) -> Int {
        var instructions: [Instruction?] = input.components(separatedBy: CharacterSet.newlines).compactMap { Instruction(from: $0) }
        var index = 0
        var accumulator = 0
        
        while let instruction = instructions[index] {
            instructions[index] = nil
            
            switch instruction.operation {
            case .accumulator:
                accumulator += instruction.argument
                index += 1
            case .jumps:
                index += instruction.argument
            case .noOperation:
                index += 1
            }
        }
        
        return accumulator
    }
}

extension Solution.Instruction {
    
    init?(from rawData: String) {
        guard rawData.count > 0 else {
            return nil
        }
        
        let components = rawData.components(separatedBy: " ")
        
        guard
            components.count > 1,
            let operation = Solution.Operation(rawValue: components[0]),
            let argument = Int(components[1])
        else {
            fatalError("[❗️] Unknown instruction: \(rawData)")
        }
        
        self.operation = operation
        self.argument = argument
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
