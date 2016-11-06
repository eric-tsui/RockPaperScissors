//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by EricTsui on 6/11/16.
//  Copyright © 2016 EricTsui. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    // MARK: Programmatic Approach
    @IBAction func playPaper(_ sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsVC") as! ResultsViewController
        vc.userChoice = getUserChoiceShape(sender as! UIButton)
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: Segue with Code Approach
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let vc = segue.destination as! ResultsViewController
            vc.userChoice = getUserChoiceShape(sender as! UIButton)
        }
    }
    
    @IBAction func playScissors(_ sender: AnyObject) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let shapeUI = ["paper"/*tag 0*/, "scissors"/*tag 1*/, "rock"/*tag 2*/]
    private func getUserChoiceShape(_ sender: UIButton) -> Shape {
        let shape = shapeUI[sender.tag]
        return Shape(rawValue: shape)!
    }

}

