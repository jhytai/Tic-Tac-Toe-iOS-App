//
//  GameViewController.swift
//  Tic-Tac-Toe
//
//  Created by Josh Tai on 10/18/23.
//

import UIKit

class GameViewController: UIViewController
{
    var roundsLabel  : UILabel!
    var p1NameLabel  : UILabel!
    var p2NameLabel  : UILabel!
    var p1ScoreLabel : UILabel!
    var p2ScoreLabel : UILabel!
    var gridView     : UIView!
    var gridImage    : UIImageView!
    var slot1Image   : UIImageView!
    var slot2Image   : UIImageView!
    var slot3Image   : UIImageView!
    var slot4Image   : UIImageView!
    var slot5Image   : UIImageView!
    var slot6Image   : UIImageView!
    var slot7Image   : UIImageView!
    var slot8Image   : UIImageView!
    var slot9Image   : UIImageView!
    var slotSizeMult : CGFloat = 0.27

    override func viewDidLoad()
        {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }

    override func loadView()
    {
        super.loadView()
        
        // Initialize Rounds Label (roundsLabel)
        self.roundsLabel = UILabel()
        self.roundsLabel.text = "Rounds left: ?"
        self.roundsLabel.font = UIFont.systemFont(ofSize: 20)
        self.roundsLabel.numberOfLines = 0
        self.roundsLabel.lineBreakMode = .byWordWrapping
        self.roundsLabel.textAlignment = .center
        self.roundsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(roundsLabel)
        
        // Initialize P1 Name Label (p1NameLabel)
        self.p1NameLabel = UILabel()
        self.p1NameLabel.text = "-> Player 1: ???"
        self.p1NameLabel.font = UIFont.systemFont(ofSize: 20)
        self.p1NameLabel.numberOfLines = 0
        self.p1NameLabel.lineBreakMode = .byWordWrapping
        self.p1NameLabel.textAlignment = .center
        self.p1NameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(p1NameLabel)
        
        // Initialize P1 Score Label (p1ScoreLabel)
        self.p1ScoreLabel = UILabel()
        self.p1ScoreLabel.text = "Score: ?"
        self.p1ScoreLabel.font = UIFont.systemFont(ofSize: 20)
        self.p1ScoreLabel.numberOfLines = 0
        self.p1ScoreLabel.lineBreakMode = .byWordWrapping
        self.p1ScoreLabel.textAlignment = .center
        self.p1ScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(p1ScoreLabel)
        
        // Initialize Grid View (gridView)
        self.gridView = UIView()
        self.gridView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(gridView)
        
        // Initialize Grid Image (gridImage) inside Grid View (gridView)
        self.gridImage = UIImageView(image: UIImage(named: "TheGrid"))
        self.gridImage.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(gridImage)
        
        // Initialize Slot 1 Image (slot1Image)
        self.slot1Image = UIImageView(image: UIImage(named: "TheBlank"))
        self.slot1Image.isUserInteractionEnabled = true
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(tappedS1(_:)))
        self.slot1Image.addGestureRecognizer(tapGestureRecognizer1)
        self.slot1Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot1Image)
        
        // Initialize Slot 2 Image (slot2Image)
        self.slot2Image = UIImageView(image: UIImage(named: "TheBlank"))
        self.slot2Image.isUserInteractionEnabled = true
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(tappedS2(_:)))
        self.slot2Image.addGestureRecognizer(tapGestureRecognizer2)
        self.slot2Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot2Image)
        
        // Initialize Slot 3 Image (slot3Image)
        self.slot3Image = UIImageView(image: UIImage(named: "TheBlank"))
        self.slot3Image.isUserInteractionEnabled = true
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(tappedS3(_:)))
        self.slot3Image.addGestureRecognizer(tapGestureRecognizer3)
        self.slot3Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot3Image)
        
        // Initialize Slot 4 Image (slot4Image)
        self.slot4Image = UIImageView(image: UIImage(named: "TheBlank"))
        self.slot4Image.isUserInteractionEnabled = true
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(tappedS4(_:)))
        self.slot4Image.addGestureRecognizer(tapGestureRecognizer4)
        self.slot4Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot4Image)
        
        // Initialize Slot 5 Image (slot5Image)
        self.slot5Image = UIImageView(image: UIImage(named: "TheBlank"))
        self.slot5Image.isUserInteractionEnabled = true
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(tappedS5(_:)))
        self.slot5Image.addGestureRecognizer(tapGestureRecognizer5)
        self.slot5Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot5Image)
        
        // Initialize Slot 6 Image (slot6Image)
        self.slot6Image = UIImageView(image: UIImage(named: "TheBlank"))
        self.slot6Image.isUserInteractionEnabled = true
        let tapGestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(tappedS6(_:)))
        self.slot6Image.addGestureRecognizer(tapGestureRecognizer6)
        self.slot6Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot6Image)
        
        // Initialize Slot 7 Image (slot7Image)
        self.slot7Image = UIImageView(image: UIImage(named: "TheBlank"))
        self.slot7Image.isUserInteractionEnabled = true
        let tapGestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(tappedS7(_:)))
        self.slot7Image.addGestureRecognizer(tapGestureRecognizer7)
        self.slot7Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot7Image)
        
        // Initialize Slot 8 Image (slot8Image)
        self.slot8Image = UIImageView(image: UIImage(named: "TheBlank"))
        self.slot8Image.isUserInteractionEnabled = true
        let tapGestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(tappedS8(_:)))
        self.slot8Image.addGestureRecognizer(tapGestureRecognizer8)
        self.slot8Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot8Image)
        
        // Initialize Slot 9 Image (slot9Image)
        self.slot9Image = UIImageView(image: UIImage(named: "TheBlank"))
        self.slot9Image.isUserInteractionEnabled = true
        let tapGestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(tappedS9(_:)))
        self.slot9Image.addGestureRecognizer(tapGestureRecognizer9)
        self.slot9Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot9Image)
        
        // Initialize P2 Score Label (p2ScoreLabel)
        self.p2ScoreLabel = UILabel()
        self.p2ScoreLabel.text = "Score: ?"
        self.p2ScoreLabel.font = UIFont.systemFont(ofSize: 20)
        self.p2ScoreLabel.numberOfLines = 0
        self.p2ScoreLabel.lineBreakMode = .byWordWrapping
        self.p2ScoreLabel.textAlignment = .center
        self.p2ScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(p2ScoreLabel)
        
        // Initialize P2 Name Label (p2NameLabel)
        self.p2NameLabel = UILabel()
        self.p2NameLabel.text = "Player 2: ???"
        self.p2NameLabel.font = UIFont.systemFont(ofSize: 20)
        self.p2NameLabel.numberOfLines = 0
        self.p2NameLabel.lineBreakMode = .byWordWrapping
        self.p2NameLabel.textAlignment = .center
        self.p2NameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(p2NameLabel)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            // Constraints for the Rounds Label (roundsLabel)
            self.roundsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.roundsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            self.roundsLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            self.roundsLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            // Constraints for the P1 Name Label (p1NameLabel)
            self.p1NameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.p1NameLabel.topAnchor.constraint(equalTo: roundsLabel.bottomAnchor, constant: 40),
            self.p1NameLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            self.p1NameLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            // Constraints for the P1 Score Label (p1ScoreLabel)
            self.p1ScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.p1ScoreLabel.topAnchor.constraint(equalTo: p1NameLabel.bottomAnchor, constant: 20),
            self.p1ScoreLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            self.p1ScoreLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            // Constraints for the Grid View (gridView)
            self.gridView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            self.gridView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            self.gridView.topAnchor.constraint(equalTo: p1ScoreLabel.bottomAnchor, constant: 40),
            self.gridView.heightAnchor.constraint(equalTo: gridView.widthAnchor),
            
            // Constraints for the Grid Image (gridImage)
            self.gridImage.widthAnchor.constraint(equalTo: gridView.widthAnchor),
            self.gridImage.heightAnchor.constraint(equalTo: gridView.heightAnchor),
            self.gridImage.centerXAnchor.constraint(equalTo: gridView.centerXAnchor),
            self.gridImage.centerYAnchor.constraint(equalTo: gridView.centerYAnchor),
            
            // Constraints for Slot 1 Image (slot1Image)
            self.slot1Image.widthAnchor.constraint(equalTo: gridView.widthAnchor, multiplier: slotSizeMult),
            self.slot1Image.heightAnchor.constraint(equalTo: slot1Image.widthAnchor),
            self.slot1Image.leadingAnchor.constraint(equalTo: gridView.leadingAnchor, constant: (view.frame.width * 0.025)),
            self.slot1Image.topAnchor.constraint(equalTo: gridView.topAnchor, constant: (view.frame.width * 0.025)),
            
            // Constraints for Slot 2 Image (slot2Image)
            self.slot2Image.widthAnchor.constraint(equalTo: gridView.widthAnchor, multiplier: slotSizeMult),
            self.slot2Image.heightAnchor.constraint(equalTo: slot2Image.widthAnchor),
            self.slot2Image.leadingAnchor.constraint(equalTo: slot1Image.trailingAnchor, constant: (view.frame.width * 0.060)),
            self.slot2Image.topAnchor.constraint(equalTo: gridView.topAnchor, constant: (view.frame.width * 0.025)),
            
            // Constraints for Slot 3 Image (slot3Image)
            self.slot3Image.widthAnchor.constraint(equalTo: gridView.widthAnchor, multiplier: slotSizeMult),
            self.slot3Image.heightAnchor.constraint(equalTo: slot3Image.widthAnchor),
            self.slot3Image.leadingAnchor.constraint(equalTo: slot2Image.trailingAnchor, constant: (view.frame.width * 0.060)),
            self.slot3Image.topAnchor.constraint(equalTo: gridView.topAnchor, constant: (view.frame.width * 0.025)),
            
            // Constraints for Slot 4 Image (slot4Image)
            self.slot4Image.widthAnchor.constraint(equalTo: gridView.widthAnchor, multiplier: slotSizeMult),
            self.slot4Image.heightAnchor.constraint(equalTo: slot4Image.widthAnchor),
            self.slot4Image.leadingAnchor.constraint(equalTo: gridView.leadingAnchor, constant: (view.frame.width * 0.025)),
            self.slot4Image.topAnchor.constraint(equalTo: slot1Image.bottomAnchor, constant: (view.frame.width * 0.060)),
            
            // Constraints for Slot 5 Image (slot5Image)
            self.slot5Image.widthAnchor.constraint(equalTo: gridView.widthAnchor, multiplier: slotSizeMult),
            self.slot5Image.heightAnchor.constraint(equalTo: slot5Image.widthAnchor),
            self.slot5Image.leadingAnchor.constraint(equalTo: slot4Image.trailingAnchor, constant: (view.frame.width * 0.060)),
            self.slot5Image.topAnchor.constraint(equalTo: slot2Image.bottomAnchor, constant: (view.frame.width * 0.060)),
            
            // Constraints for Slot 6 Image (slot6Image)
            self.slot6Image.widthAnchor.constraint(equalTo: gridView.widthAnchor, multiplier: slotSizeMult),
            self.slot6Image.heightAnchor.constraint(equalTo: slot6Image.widthAnchor),
            self.slot6Image.leadingAnchor.constraint(equalTo: slot5Image.trailingAnchor, constant: (view.frame.width * 0.060)),
            self.slot6Image.topAnchor.constraint(equalTo: slot3Image.bottomAnchor, constant: (view.frame.width * 0.060)),
            
            // Constraints for Slot 7 Image (slot7Image)
            self.slot7Image.widthAnchor.constraint(equalTo: gridView.widthAnchor, multiplier: slotSizeMult),
            self.slot7Image.heightAnchor.constraint(equalTo: slot7Image.widthAnchor),
            self.slot7Image.leadingAnchor.constraint(equalTo: gridView.leadingAnchor, constant: (view.frame.width * 0.025)),
            self.slot7Image.topAnchor.constraint(equalTo: slot4Image.bottomAnchor, constant: (view.frame.width * 0.060)),
            
            // Constraints for Slot 8 Image (slot8Image)
            self.slot8Image.widthAnchor.constraint(equalTo: gridView.widthAnchor, multiplier: slotSizeMult),
            self.slot8Image.heightAnchor.constraint(equalTo: slot8Image.widthAnchor),
            self.slot8Image.leadingAnchor.constraint(equalTo: slot7Image.trailingAnchor, constant: (view.frame.width * 0.060)),
            self.slot8Image.topAnchor.constraint(equalTo: slot5Image.bottomAnchor, constant: (view.frame.width * 0.060)),
            
            // Constraints for Slot 9 Image (slot9Image)
            self.slot9Image.widthAnchor.constraint(equalTo: gridView.widthAnchor, multiplier: slotSizeMult),
            self.slot9Image.heightAnchor.constraint(equalTo: slot9Image.widthAnchor),
            self.slot9Image.leadingAnchor.constraint(equalTo: slot8Image.trailingAnchor, constant: (view.frame.width * 0.060)),
            self.slot9Image.topAnchor.constraint(equalTo: slot6Image.bottomAnchor, constant: (view.frame.width * 0.060)),
            
            // Constraints for the P2 Score Label (p2ScoreLabel)
            self.p2ScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.p2ScoreLabel.topAnchor.constraint(equalTo: gridView.bottomAnchor, constant: 40),
            self.p2ScoreLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            self.p2ScoreLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            // Constraints for the P2 Name Label (p2NameLabel)
            self.p2NameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.p2NameLabel.topAnchor.constraint(equalTo: p2ScoreLabel.bottomAnchor, constant: 20),
            self.p2NameLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            self.p2NameLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            ])
    }

    @objc func tappedS1(_ sender: UIButton)
        {
        print("Slot 1 tapped!")
        // code here
        }

    @objc func tappedS2(_ sender: UIButton)
        {
        print("Slot 2 tapped!")
        // code here
        }

    @objc func tappedS3(_ sender: UIButton)
        {
        print("Slot 3 tapped!")
        // code here
        }

    @objc func tappedS4(_ sender: UIButton)
        {
        print("Slot 4 tapped!")
        // code here
        }

    @objc func tappedS5(_ sender: UIButton)
        {
        print("Slot 5 tapped!")
        // code here
        }

    @objc func tappedS6(_ sender: UIButton)
        {
        print("Slot 6 tapped!")
        // code here
        }

    @objc func tappedS7(_ sender: UIButton)
        {
        print("Slot 7 tapped!")
        // code here
        }

    @objc func tappedS8(_ sender: UIButton)
        {
        print("Slot 8 tapped!")
        // code here
        }

    @objc func tappedS9(_ sender: UIButton)
        {
        print("Slot 9 tapped!")
        // code here
        }



}
