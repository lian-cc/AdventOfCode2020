import UIKit

/*
 * Day 7: Handy Haversacks
 */

class Solution {
    
    var rules = [String: [String]]()
    
    func result(for target: String, withInputRules inputRules: String) -> Int {
        self.rules = rules(from: inputRules)
        print()
        return countCotent(for: target)
    }
    
    func countCotent(for target: String) -> Int {
        guard let contents = rules[target] else {
            fatalError("Unknown bag: \(target)")
        }
        return contents.reduce(contents.count) { result, target in
            result + countCotent(for: target)
        }
    }
    
    func rules(from input: String) -> [String: [String]] {
        var rules = [String: [String]]()
        let decimalDigits = CharacterSet.decimalDigits
        
        for var rule in input.components(separatedBy: "\n") {
            guard !rule.isEmpty else { continue }
            rule = rule.replacingOccurrences(of: "bags", with: "")
            rule = rule.replacingOccurrences(of: "bag", with: "")
            if rule.last == "." {
                rule = String(rule.dropLast())
            }
            let components = rule.components(separatedBy: "contain")
            guard components.count > 1 else {
                print("[⚠️] Unknown rule: \(rule)")
                continue
            }
            let container = components[0].trimmingCharacters(in: CharacterSet.whitespaces)
            var contents = [String]()
            for var content in components[1].components(separatedBy: ",") {
                content = content.trimmingCharacters(in: CharacterSet.whitespaces)
                guard content != "no other" else {
                    continue
                }
                guard let first = content.first, let count = Int(String(first)) else {
                    print("[⚠️] Unknown content bag: \(content)")
                    continue
                }
                let bag = content.removeCharacters(from: decimalDigits).trimmingCharacters(in: CharacterSet.whitespaces)
                contents.append(contentsOf: Array(repeating: bag, count: count))
            }
            rules[container] = contents
        }
        
        return rules
    }
}

// 🔗https://stackoverflow.com/a/41649414/6545858
extension String {

    func removeCharacters(from forbiddenChars: CharacterSet) -> String {
        let passed = unicodeScalars.filter { !forbiddenChars.contains($0) }
        return String(String.UnicodeScalarView(passed))
    }

    func removeCharacters(from: String) -> String {
        return removeCharacters(from: CharacterSet(charactersIn: from))
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
