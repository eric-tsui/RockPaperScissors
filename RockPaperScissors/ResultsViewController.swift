//
//  ResultsViewController.swift
//  RockPaperScissors
//
//  Created by EricTsui on 6/11/16.
//  Copyright © 2016 EricTsui. All rights reserved.
//

import UIKit

// MARK: -Shape: String

enum Shape: String{
    case Rock = "rock"
    case Paper = "paper"
    case Scissors = "scissors"
    
    static func randomShape() -> Shape {
        let shapes = ["rock", "paper", "scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}

class ResultsViewController: UIViewController {

    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!
    
    var userChoice: Shape!
    private let computerChoice: Shape = Shape.randomShape()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    private func displayResult() {
        
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(computerChoice.rawValue)"
        
        switch(userChoice!, computerChoice) {
        case let (user, computer) where user == computer:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)_\(computerChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(computerChoice.rawValue)_\(userChoice.rawValue)"
        }
        
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
        
        /* Above solution is using 'userChoice!', which has a exclamation mark (!) following
           Below is just another solution, which use let...
         
         if let userChoiceConstant = userChoice {
            switch(userChoiceConstant, computerChoice) {
            case let (user, computer) where user == computer:
                text = "\(matchup): it's a tie!"
                imageName = "tie"
            case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
                text = "You win with \(matchup)!"
                imageName = "\(userChoice.rawValue)_\(computerChoice.rawValue)"
            default:
                text = "You lose with \(matchup) :(."
                imageName = "\(computerChoice.rawValue)_\(userChoice.rawValue)"
            }
         
            resultImage.image = UIImage(named: imageName)
            resultLabel.text = text
         }
         
         */
        
    }
    
    @IBAction func playAgain(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
