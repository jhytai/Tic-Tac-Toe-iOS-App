//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Josh Tai on 10/18/23.
//

import UIKit

// View Controller for Main (Landing Page / Welcome Page)
class ViewController: UIViewController
{
    var welcomeLabel: UILabel!
    var logoImageView: UIImageView!
    var getStartedButton: UIButton!

    override func viewDidLoad()
        {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }

    override func loadView()
    {
        super.loadView()
        
        // Initialize Welcome Label
        self.welcomeLabel = UILabel()
        self.welcomeLabel.text = "The Tic-TacToe Game"
        self.welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(welcomeLabel)
        
        // Initialize Logo Image
        self.logoImageView = UIImageView(image: UIImage(named: "TheLogo"))
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(logoImageView)
        
        // Initialize Get Started Button
        self.getStartedButton = UIButton(type: .system)
        self.getStartedButton.setTitle("Get Started", for: .normal)
        self.getStartedButton.addTarget(self,
                                        action: #selector(getStartedButtonTapped(_:)),
                                        for: .touchUpInside)
        self.getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(getStartedButton)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            // Constrain welcomeLabel
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            // Constrain logoImageView
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 50),
            
            // Constrain getStartedButton
            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStartedButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 25)
        ])
    }

    @objc func getStartedButtonTapped(_ sender: UIButton)
        {
        print("Get Started button tapped!")
        }

}
