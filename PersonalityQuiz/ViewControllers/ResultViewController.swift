//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findAnimal()
        navigationItem.hidesBackButton = true
        
    }
    
    func findAnimal() {
        var countOfAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            countOfAnimals[animal] = (countOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedCountOfAnimals = countOfAnimals.sorted {$0.value > $1.value}
        
        guard let foundAnimal = sortedCountOfAnimals.first?.key else { return }
        
        resultAnswerLabel.text = "Вы - \(foundAnimal.rawValue)!"
        resultDefinitionLabel.text = "\(foundAnimal.definition)"
    }
}


