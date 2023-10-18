//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Josh Tai on 10/18/23.
//

import UIKit

// View Controller for Landing Page
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
        self.welcomeLabel.text = "The Tic Tac Toe Game"
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
        self.getStartedButton.setTitle("Get Started", for: .normal)
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
        }

}
