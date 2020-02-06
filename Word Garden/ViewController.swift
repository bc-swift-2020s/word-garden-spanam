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
    var wordsToGuess = ["SWIFT", "HELLO", "PINEAPPLE", "IPHONE"]
    var wordToGuess = "SWIFT"
    var currentWord = 0
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    
    func setNumberGuesses() {
        guessCountLabel.text = "You've made \(guesses) Guesses"
    }
    
    func resetGuessedLetterField() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
        guessLetterButton.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNumberGuesses()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
        formatUserGuessLabel()
    }
    
    func formatUserGuessLabel() {
//        print("letter guess made! guessed \(guessedLetterField.text!)")
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
//        print("letters guessed so far: \(lettersGuessed)")
        
        for letter in wordToGuess {
//            print("now checking letter \(letter)")
            if lettersGuessed.contains(letter) {
                revealedWord += " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    func guessALetter() {
        formatUserGuessLabel()
        
        guessCount += 1
        
        // if guess is wrong, decrements wrongGuessesRemaining and updates flower image
        let currentLetterGuessed = guessedLetterField.text!
        print("current letter guessed: \(currentLetterGuessed)")
        if !wordToGuess.contains(currentLetterGuessed) {
            wrongGuessesRemaining -= 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        
        let revealedWord = userGuessLabel.text!
        // stop game if wrongGuessesRemaining == 0
        if wrongGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You've run out of guesses! Try again?"
        } else if !revealedWord.contains("_") {
            // you've won!
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You got it! It took you \(guessCount) guesses to find the word."
        } else {
            // update guess count
            guessCountLabel.text = "You've made \(guessCount) \(guessCount == 1 ? "guess" : "guesses")"
        }
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        } else {
            guessLetterButton.isEnabled = false
        }
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
//        print("GuessLetterPressed")
        guessALetter()
        resetGuessedLetterField()
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
//        print("DoneKeyPressed")
        guessALetter()
        resetGuessedLetterField()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        guessCount = 0
        guessCountLabel.text = "You've made \(guessCount) guesses"
        currentWord = (currentWord + 1) % wordsToGuess.count
        wordToGuess = wordsToGuess[currentWord]
        formatUserGuessLabel()
    }
    

}

