//: ## Caluclate Grades and manage time more efficient
import Foundation

struct Grade {
    let score: Double
    let weight: Int
}

extension SequenceType where Generator.Element == Grade {
    func calculateFinalGrade() -> Double {
        
        let scoreTotal = self.reduce(0.0) { $0 + $1.score * Double($1.weight)}
        let importanceTotal = self.reduce(0) { $0 + $1.weight }
        
        return scoreTotal / Double(importanceTotal)
    }
}


let scheikunde = [
    Grade(score: 4.2, weight: 2),
    Grade(score: 4.8, weight: 1),
    Grade(score: 2.1, weight: 2),
    Grade(score: 5.6, weight: 2)
]



scheikunde.calculateFinalGrade()



