//
//  SettingsViewController.swift
//  Tic-Tac-Toe
//
//  Created by Josh Tai on 10/18/23.
//

import UIKit

class SettingsViewController: UIViewController
{
    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var p1Label: UILabel!
    @IBOutlet var p2Label: UILabel!
    @IBOutlet var roundsLabel: UILabel!
    @IBOutlet var p1TextField: UITextField!
    @IBOutlet var p2TextField: UITextField!
    @IBOutlet var roundsTextField: UITextField!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var p1Image: UIImageView!
    @IBOutlet var p2Image: UIImageView!

    var p1name: String = ""
    var p2name: String = ""
    var rounds: Int = 0

    override func viewDidLoad()
        {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer)
        {
        self.p1TextField.resignFirstResponder()
        self.p2TextField.resignFirstResponder()
        self.roundsTextField.resignFirstResponder()
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
        let text = textField.text ?? ""
        rounds = Int(text) ?? 0
        print("Amount of rounds edited to \(rounds)")
        }

    // Callback for playButton
    @IBAction func playButtonTapped(_ sender: UIButton)
        {
        print("Play button tapped!")
        tabBarController?.selectedIndex = 2
        //add code to reset game variables when this button is tapped
        }

}
