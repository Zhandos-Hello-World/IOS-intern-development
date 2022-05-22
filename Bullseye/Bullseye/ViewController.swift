//
//  ViewController.swift
//  Bullseye
//
//  Created by Zhandos Baimurat on 18.05.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()
    }

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
                
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            points += 50
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        let message = "You scored \(points) points"
        
        
        let alert = UIAlertController(title: title,
                                    message: message,    // changed
                             preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",          // changed
                                   style: .default,
                                 handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(round)"
    }
    
    
    func startNewRound() {
        round += 1
        currentValue = lround(Double(slider.value))
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    @IBAction func startNewGame() {
        addHighScore(score)
        score = 0
        round = 0
        startNewRound()
    }
    func addHighScore(_ score: Int) {
        guard score > 0 else {
            return
        }
        let highScore = HighScoreItem()
        highScore.score = score
        highScore.name = "Unknown"
        
        var highScores = PersistencyHelper.loadHighScores()
        highScores.append(highScore)
        highScores.sort { $0.score > $1.score }
        
        PersistencyHelper.saveHighScores(highScores)
    }
    
}

