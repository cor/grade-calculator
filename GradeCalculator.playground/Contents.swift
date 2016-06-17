//: ## Caluclate Grades and manage time more efficient
import Foundation

struct Grade {
    let value: Double
    let importance: Int
}

func calculateResult(grades grades: [Grade]) -> Double {
    
    let valueTotal = grades.reduce(0.0) { $0 + $1.value * Double($1.importance)}
    let importanceTotal = grades.reduce(0) { $0 + $1.importance }
    
    return valueTotal / Double(importanceTotal)
}

calculateResult(grades: [
    Grade(value: 6.0, importance: 1),
    Grade(value: 8, importance: 2)
    ])
