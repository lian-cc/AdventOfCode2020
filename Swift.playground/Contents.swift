import UIKit

/*
 * Day 7: Handy Haversacks
 */

class Solution {
    
    func result(for target: String, withInputRules inputRules: String) -> Int {
        return 0
    }
}

let sol = Solution()
let input: String
let target = "shiny gold"

do {
    guard let path = Bundle.main.path(forResource: "input", ofType: "txt") else {
        fatalError("Path for input.txt is not found")
    }
    input = try String(contentsOfFile: path)
} catch {
    fatalError(error.localizedDescription)
}

print(sol.result(for: target, withInputRules: input))
