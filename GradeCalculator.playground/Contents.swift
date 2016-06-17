//: ## Caluclate Grades and manage time more efficient
import Foundation

struct Grade {
    let score: Double
    let importance: Int
}

extension SequenceType where Generator.Element == Grade {
    func calculateResult() -> Double {
        
        let scoreTotal = self.reduce(0.0) { $0 + $1.score * Double($1.importance)}
        let importanceTotal = self.reduce(0) { $0 + $1.importance }
        
        return scoreTotal / Double(importanceTotal)
    }
}


let scheikunde = [
    Grade(score: 4.2, importance: 2),
    Grade(score: 4.8, importance: 1),
    Grade(score: 2.1, importance: 2),
    Grade(score: 5.6, importance: 2)
]



scheikunde.calculateResult()


