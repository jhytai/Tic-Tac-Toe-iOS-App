//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Josh Tai on 10/18/23.
//

import UIKit
import AVKit

// View Controller for Landing Page
class ViewController: UIViewController
{
    private var welcomeLabel     : UILabel!
    private var logoImageView    : UIImageView!
    private var getStartedButton : UIButton!
    private var audioPlayer      : AVAudioPlayer!

    override func viewDidLoad()
        {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBarController?.selectedIndex = 1
        tabBarController?.selectedIndex = 2
        tabBarController?.selectedIndex = 0
        }

    override func loadView()
        {
        super.loadView()
        
        // Initialize Welcome Label
        self.welcomeLabel = UILabel()
        self.welcomeLabel.text = NSLocalizedString("The Tic Tac Toe Game", comment: "Home page title")
        self.welcomeLabel.font = UIFont.systemFont(ofSize: 40)
        self.welcomeLabel.numberOfLines = 0
        self.welcomeLabel.lineBreakMode = .byWordWrapping
        self.welcomeLabel.textAlignment = .center
        self.welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(welcomeLabel)
        
        // Initialize Logo Image
        self.logoImageView = UIImageView(image: UIImage(named: "TheLogo"))
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(logoImageView)
        
        // Initialize Get Started Button
        self.getStartedButton = UIButton(type: .system)
        self.getStartedButton.setTitle(NSLocalizedString("Get Started", comment: "Get Startes button label"), for: .normal)
        self.getStartedButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        self.getStartedButton.addTarget(self, action: #selector(getStartedButtonTapped(_:)), for: .touchUpInside)
        self.getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(getStartedButton)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            // Constrain welcomeLabel
            self.welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.welcomeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.welcomeLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            // Constrain logoImageView
            self.logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.logoImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 50),
            self.logoImageView.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.logoImageView.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),
            
            // Constrain getStartedButton
            self.getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.getStartedButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50)
            ])
        }

    @objc func getStartedButtonTapped(_ sender: UIButton)
        {
        print("Get Started button tapped!")
        tabBarController?.selectedIndex = 1
        
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

}
