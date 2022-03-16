//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var descriptionAnimalLabel: UILabel!
    
    // MARK: - Public Properties
    var responses: [Answer] = []
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResult()
    }
    
    // MARK: - Private Methods
    private func calculateResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) { (counter, answer) in
            counter[answer.animal, default: 0] += 1
        }
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        animalTypeLabel.text = "Вы - \(mostCommonAnswer.rawValue)"
        descriptionAnimalLabel.text = mostCommonAnswer.definition
    }
    
}
