//
//  ViewController.swift
//  Word Garden
//
//  Created by Matthew Spana on 2/4/20.
//  Copyright © 2020 Matthew Spana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    var guesses = 0;
    
    func setNumberGuesses() {
        guessCountLabel.text = "You've made \(guesses) Guesses"
    }
    
    func resetGuessedLetterField() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNumberGuesses()
    }

    @IBAction func doneKeyPressed(_ sender: UITextField) {
        resetGuessedLetterField()
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if guessedLetterField.text == nil {
            
        }
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        resetGuessedLetterField()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
    

}

