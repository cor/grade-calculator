//: ## Caluclate Grades and manage time more efficient
import Foundation

struct Grade: CustomStringConvertible {
    let score: Double
    let weight: Int
    
    var description: String {
        return "score: \(score) weight: \(weight)"
    }
}

struct Subject: CustomStringConvertible {
    let name: String
    let grades: [Grade]
    
    var finalGrade: Double {
        
        let scoreTotal = grades.reduce(0.0) { $0 + $1.score * Double($1.weight) }
        let importanceTotal = grades.reduce(0) { $0 + $1.weight }
        
        return scoreTotal / Double(importanceTotal)
        
    }
    
    var roundedFinalGrade: Double {
        return Double(round(10*finalGrade)/10)
    }
    
    var description: String {
        return "name: \(name), grades: \(grades), finalGrade: \(roundedFinalGrade)"
    }
    
    func requiredGrade(target targetGrade: Double, weight: Int) -> Double {
        let scoreTotal = grades.reduce(0.0) { $0 + $1.score * Double($1.weight) }
        let weightTotal = grades.reduce(0) { $0 + $1.weight } + weight
        
        return ((targetGrade * Double(weightTotal)) - scoreTotal) / Double(weight)
    }
}



let subjects = [
    Subject(name: "Scheikunde", grades: [
        Grade(score: 4.2, weight: 2),
        Grade(score: 4.8, weight: 1),
        Grade(score: 2.1, weight: 2),
        Grade(score: 5.6, weight: 2)
    ]),
    Subject(name: "Wiskunde", grades: [
        Grade(score: 7.1, weight: 1),
        Grade(score: 6.7, weight: 1),
        Grade(score: 8.0, weight: 1),
        Grade(score: 2.2, weight: 1)
    ]),
    Subject(name: "Natuurkunde", grades: [
        Grade(score: 7.3, weight: 1),
        Grade(score: 6.0, weight: 1),
        Grade(score: 4.5, weight: 1),
        Grade(score: 7.7, weight: 1)
    ]),
    Subject(name: "Informatica", grades: [
        Grade(score: 9.0, weight: 1),
        Grade(score: 9.1, weight: 1),
        Grade(score: 8.2, weight: 1),
        Grade(score: 8.5, weight: 1)
    ]),
    Subject(name: "Kunst", grades: [
        Grade(score: 8.2, weight: 2),
        Grade(score: 7.5, weight: 2),
        Grade(score: 4.1, weight: 2),
        Grade(score: 2.2, weight: 2)
    ]),
    Subject(name: "Engels", grades: [
        Grade(score: 4.4, weight: 1),
        Grade(score: 6.1, weight: 1),
        Grade(score: 6.5, weight: 2),
        Grade(score: 6.0, weight: 1),
        Grade(score: 7.8, weight: 1),
        Grade(score: 7.5, weight: 2)
    ]),
    Subject(name: "Nederlands", grades: [
        Grade(score: 7.7, weight: 2),
        Grade(score: 6.8, weight: 1),
        Grade(score: 6.0, weight: 1),
        
    ]),
    Subject(name: "Godsdienst", grades: [
        Grade(score: 8.5, weight: 1),
        Grade(score: 6.9, weight: 1),
        Grade(score: 6.0, weight: 1),
        
    
    ])
]


let finalGrades = subjects.map { "\($0.name): \($0.roundedFinalGrade)" }

finalGrades

let natuurkunde = subjects.filter { $0.name == "Natuurkunde" }.first!
let wiskunde = subjects.filter { $0.name == "Wiskunde" }.first!
let informatica = subjects.filter { $0.name == "Informatica" }.first!
let nederlands = subjects.filter { $0.name == "Nederlands" }.first!
let scheikunde = subjects.filter { $0.name == "Scheikunde" }.first!


informatica.requiredGrade(target: 5.5, weight: 1)
wiskunde.requiredGrade(target: 6.0, weight: 1)
natuurkunde.requiredGrade(target: 6.0, weight: 1)
nederlands.requiredGrade(target: 6.0, weight: 1)
scheikunde.requiredGrade(target: 4.5, weight: 2)




