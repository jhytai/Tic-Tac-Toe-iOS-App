//
//  SettingsViewController.swift
//  Tic-Tac-Toe
//
//  Created by Josh Tai on 10/18/23.
//

import UIKit
import AVKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var settingsLabel   : UILabel!
    @IBOutlet var p1Label         : UILabel!
    @IBOutlet var p2Label         : UILabel!
    @IBOutlet var roundsLabel     : UILabel!
    @IBOutlet var p1TextField     : UITextField!
    @IBOutlet var p2TextField     : UITextField!
    @IBOutlet var roundsTextField : UITextField!
    @IBOutlet var playButton      : UIButton!
    @IBOutlet var p1Image         : UIImageView!
    @IBOutlet var p2Image         : UIImageView!

    private var p1name       : String = ""
    private var p2name       : String = ""
    private var rounds       : Float = 0
    private var audioPlayer : AVAudioPlayer!

    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
        }()

    override func viewDidLoad()
        {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }

    // Function to control and validate changes to Rounds Text Input Field
    func textField(_ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool
        {
        let keyboardType = textField.keyboardType
        
        if  keyboardType == .numberPad {
            // Define character set that includes only numeric characters
            let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
            
            // Check if the replacement string contains only the allowed characters
            let characterSet = CharacterSet(charactersIn: string)
            
            // If only numeric digits, accept. Else, reject the replacement string
            return allowedCharacterSet.isSuperset(of: characterSet)
            }
        else if keyboardType == .namePhonePad {
            // Define character set that includes only letter characters
            let allowedCharacterSet = CharacterSet.letters
            
            // Iterate over string to make sure it only contains letter characters
            for c in string {
                if !allowedCharacterSet.isSuperset(of: CharacterSet(charactersIn: String(c))) {
                    // Prevent input on non letter characters
                    return false
                    }
                }
            }
        else if keyboardType == .decimalPad {
            if string.rangeOfCharacter(from: CharacterSet.letters) != nil
                {
                return false
                }
            
            let currentLocale = Locale.current
            let decimalSeparator = currentLocale.decimalSeparator ?? "."
            let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
            let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
            
            if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil
                {
                return false
                }
            }
        
        return true
        }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer)
        {
        self.p1TextField.resignFirstResponder()
        self.p2TextField.resignFirstResponder()
        self.roundsTextField.resignFirstResponder()
        if (roundsTextField.text != "")
            {
            let temp = Int(rounds)
            roundsTextField.text = String(temp)
            }
        print("Background tapped!")
        }

    // Callback for p1TextField
    @IBAction func p1TextFieldEdited(_ textField: UITextField)
        {
        let text = textField.text ?? ""
        p1name = String(text)
        print("Player 1 name edited to \(p1name)")
        }

    // Callback for p2TextField
    @IBAction func p2TextFieldEdited(_ textField: UITextField)
        {
        let text = textField.text ?? ""
        p2name = String(text)
        print("Player 2 name edited to \(p2name)")
        }

    // Callback for roundsTextField
    @IBAction func roundsTextFieldEdited(_ textField: UITextField)
        {
        //let text = textField.text ?? ""
        //rounds = Float(text) ?? 0
        
        if let text = textField.text, let number = numberFormatter.number(from: text)
            {
            rounds = number.floatValue
            }
        else
            {
            rounds = 0
            }
        
        print("Amount of rounds edited to \(rounds)")
        }

    // Callback for playButton
    @IBAction func playButtonTapped(_ sender: UIButton)
        {
        print("Play button tapped!")
        
        if (rounds > 0 && p1name != "" && p2name != "")
            {
            // Get the existing instance of GameViewController
            if let gameVC = tabBarController?.viewControllers?[2] as? GameViewController
                {
                // Reset the game parameters
                gameVC.roundsCount = Int(rounds)
                gameVC.name1 = p1name
                gameVC.name2 = p2name
                gameVC.score1 = 0
                gameVC.score2 = 0
                gameVC.whoStarted = 1
                gameVC.turn = 1
                gameVC.s1 = 0
                gameVC.s2 = 0
                gameVC.s3 = 0
                gameVC.s4 = 0
                gameVC.s5 = 0
                gameVC.s6 = 0
                gameVC.s7 = 0
                gameVC.s8 = 0
                gameVC.s9 = 0
                gameVC.slot1Image.image = UIImage(named: "TheBlank")
                gameVC.slot2Image.image = UIImage(named: "TheBlank")
                gameVC.slot3Image.image = UIImage(named: "TheBlank")
                gameVC.slot4Image.image = UIImage(named: "TheBlank")
                gameVC.slot5Image.image = UIImage(named: "TheBlank")
                gameVC.slot6Image.image = UIImage(named: "TheBlank")
                gameVC.slot7Image.image = UIImage(named: "TheBlank")
                gameVC.slot8Image.image = UIImage(named: "TheBlank")
                gameVC.slot9Image.image = UIImage(named: "TheBlank")
                gameVC.p1NameLabel.text = NSLocalizedString("-> Player 1: ", comment: "Settings Page's player 1 name label") + p1name
                gameVC.p1NameLabel.textColor = .blue
                gameVC.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
                gameVC.p2NameLabel.text = NSLocalizedString("Player 2: ", comment: "Settings Page's player 2 name label") + p2name
                gameVC.p2NameLabel.textColor = .black
                gameVC.p2NameLabel.font = UIFont.systemFont(ofSize: 20)
                }
            print("Game settings accepted, parameters reseted, ready to play.")
            tabBarController?.selectedIndex = 2
            
            if (roundsTextField.text != "")
                {
                let temp = Int(rounds)
                roundsTextField.text = String(temp)
                }
            
            if let audioPath = Bundle.main.path(forResource: "Banana_Slip", ofType: "mp3")
                {
                do  {
                    let audioURL = URL(fileURLWithPath: audioPath)
                    try self.audioPlayer = AVAudioPlayer(contentsOf: audioURL)
                    self.audioPlayer.volume = 10
                    self.audioPlayer.currentTime = 0
                    self.audioPlayer.prepareToPlay()
                    self.audioPlayer.play()
                    }
                catch { print("Failed to play Banana_Slip sound.") }
                }
            }
        else
            {
            print("Game settings rejected.")
            let alert = UIAlertController(title: NSLocalizedString("Game settings rejected.", comment: "Settings Page's Alert title text"),
                message: NSLocalizedString("Please re-enter valid settings.", comment: "Settings Page's Alert message text"),
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            if let audioPath = Bundle.main.path(forResource: "Rooster_Crowing", ofType: "mp3")
                {
                do  {
                    let audioURL = URL(fileURLWithPath: audioPath)
                    try self.audioPlayer = AVAudioPlayer(contentsOf: audioURL)
                    self.audioPlayer.volume = 10
                    self.audioPlayer.currentTime = 0
                    self.audioPlayer.prepareToPlay()
                    self.audioPlayer.play()
                    }
                catch { print("Failed to play Rooster_Crowing sound.") }
                }
            }
        }

}
