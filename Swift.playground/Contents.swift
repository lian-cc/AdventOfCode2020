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
        let instructions: [Instruction] = input.components(separatedBy: CharacterSet.newlines).compactMap { Instruction(from: $0) }
        var changeIndex = -1
        
        while changeIndex < instructions.count {
            let result = tryToGoal(for: instructions, changeAfter: changeIndex)
            switch result {
            case let .success(accumulator):
                return accumulator
            case let .failure(.infiniteLoop(changedAtIndex)):
                guard let index = changedAtIndex else {
                    fatalError("No changes anymore")
                }
                changeIndex = index
            case .failure(.outOfRange):
                fatalError("Out of range")
            }
        }
        
        fatalError("Answer is not found")
    }
    
    enum BootError: Error {
        case infiniteLoop(changedAt: Int?)
        case outOfRange
    }
    
    func tryToGoal(for instructions: [Instruction], changeAfter: Int) -> Result<Int, BootError> {
        var runInstructions: [Instruction?] = instructions
        var index = 0
        var accumulator = 0
        var runStep = 0
        var changedAtStep: Int? = nil
        
        while index >= 0, index < instructions.count {
            guard let instruction = runInstructions[index] else {
                return Result.failure(.infiniteLoop(changedAt: changedAtStep))
            }
            
            runInstructions[index] = nil
            
            switch instruction.operation {
            case .jumps where changedAtStep == nil && runStep > changeAfter:
                changedAtStep = runStep
                index += 1
            case .noOperation where changedAtStep == nil && runStep > changeAfter:
                changedAtStep = runStep
                index += instruction.argument
            case .accumulator:
                accumulator += instruction.argument
                index += 1
            case .jumps:
                index += instruction.argument
            case .noOperation:
                index += 1
            }
            
            runStep += 1
            
            if index == instructions.count {
                return .success(accumulator)
            }
        }
        
        return Result.failure(.outOfRange)
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
