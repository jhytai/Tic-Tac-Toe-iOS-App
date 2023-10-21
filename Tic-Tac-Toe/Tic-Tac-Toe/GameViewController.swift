//
//  GameViewController.swift
//  Tic-Tac-Toe
//
//  Created by Josh Tai on 10/18/23.
//

import UIKit

class GameViewController: UIViewController
{
    private var roundsLabel  : UILabel!
    public  var p1NameLabel  : UILabel!
    public  var p2NameLabel  : UILabel!
    private var p1ScoreLabel : UILabel!
    private var p2ScoreLabel : UILabel!
    private var gridView     : UIView!
    private var gridImage    : UIImageView!
    private var slotSizeMult : CGFloat = 0.27

    public  var slot1Image   : UIImageView!
    public  var slot2Image   : UIImageView!
    public  var slot3Image   : UIImageView!
    public  var slot4Image   : UIImageView!
    public  var slot5Image   : UIImageView!
    public  var slot6Image   : UIImageView!
    public  var slot7Image   : UIImageView!
    public  var slot8Image   : UIImageView!
    public  var slot9Image   : UIImageView!

    public var roundsCount : Int = 0 { didSet { self.roundsLabel?.text = "Rounds left: \(roundsCount)" } }
    public var name1 = "???" { didSet { self.p1NameLabel?.text = "-> Player 1: \(name1)" } }
    public var name2 = "???" { didSet { self.p2NameLabel?.text = "Player 2: \(name2)" } }
    public var score1 : Int = 0 { didSet { self.p1ScoreLabel?.text = "Score: \(score1)" } }
    public var score2 : Int = 0 { didSet { self.p2ScoreLabel?.text = "Score: \(score2)" } }

    public var whoStarted : Int = 1
    public var turn       : Int = 1
    public var s1         : Int = 0
    public var s2         : Int = 0
    public var s3         : Int = 0
    public var s4         : Int = 0
    public var s5         : Int = 0
    public var s6         : Int = 0
    public var s7         : Int = 0
    public var s8         : Int = 0
    public var s9         : Int = 0

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
        self.roundsLabel.text = "Rounds left: \(roundsCount)"
        self.roundsLabel.font = UIFont.systemFont(ofSize: 20)
        self.roundsLabel.numberOfLines = 0
        self.roundsLabel.lineBreakMode = .byWordWrapping
        self.roundsLabel.textAlignment = .center
        self.roundsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(roundsLabel)
        
        // Initialize P1 Name Label (p1NameLabel)
        self.p1NameLabel = UILabel()
        self.p1NameLabel.text = "-> Player 1: \(name1)"
        self.p1NameLabel.textColor = .blue
        self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        self.p1NameLabel.numberOfLines = 0
        self.p1NameLabel.lineBreakMode = .byWordWrapping
        self.p1NameLabel.textAlignment = .center
        self.p1NameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(p1NameLabel)
        
        // Initialize P1 Score Label (p1ScoreLabel)
        self.p1ScoreLabel = UILabel()
        self.p1ScoreLabel.text = "Score: \(score1)"
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
        self.slot1Image = UIImageView(image: UIImage(named: "TheO"))
        self.slot1Image.isUserInteractionEnabled = true
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(tappedS1(_:)))
        self.slot1Image.addGestureRecognizer(tapGestureRecognizer1)
        self.slot1Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot1Image)
        
        // Initialize Slot 2 Image (slot2Image)
        self.slot2Image = UIImageView(image: UIImage(named: "TheX"))
        self.slot2Image.isUserInteractionEnabled = true
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(tappedS2(_:)))
        self.slot2Image.addGestureRecognizer(tapGestureRecognizer2)
        self.slot2Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot2Image)
        
        // Initialize Slot 3 Image (slot3Image)
        self.slot3Image = UIImageView(image: UIImage(named: "TheO"))
        self.slot3Image.isUserInteractionEnabled = true
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(tappedS3(_:)))
        self.slot3Image.addGestureRecognizer(tapGestureRecognizer3)
        self.slot3Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot3Image)
        
        // Initialize Slot 4 Image (slot4Image)
        self.slot4Image = UIImageView(image: UIImage(named: "TheX"))
        self.slot4Image.isUserInteractionEnabled = true
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(tappedS4(_:)))
        self.slot4Image.addGestureRecognizer(tapGestureRecognizer4)
        self.slot4Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot4Image)
        
        // Initialize Slot 5 Image (slot5Image)
        self.slot5Image = UIImageView(image: UIImage(named: "TheO"))
        self.slot5Image.isUserInteractionEnabled = true
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(tappedS5(_:)))
        self.slot5Image.addGestureRecognizer(tapGestureRecognizer5)
        self.slot5Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot5Image)
        
        // Initialize Slot 6 Image (slot6Image)
        self.slot6Image = UIImageView(image: UIImage(named: "TheX"))
        self.slot6Image.isUserInteractionEnabled = true
        let tapGestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(tappedS6(_:)))
        self.slot6Image.addGestureRecognizer(tapGestureRecognizer6)
        self.slot6Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot6Image)
        
        // Initialize Slot 7 Image (slot7Image)
        self.slot7Image = UIImageView(image: UIImage(named: "TheO"))
        self.slot7Image.isUserInteractionEnabled = true
        let tapGestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(tappedS7(_:)))
        self.slot7Image.addGestureRecognizer(tapGestureRecognizer7)
        self.slot7Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot7Image)
        
        // Initialize Slot 8 Image (slot8Image)
        self.slot8Image = UIImageView(image: UIImage(named: "TheX"))
        self.slot8Image.isUserInteractionEnabled = true
        let tapGestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(tappedS8(_:)))
        self.slot8Image.addGestureRecognizer(tapGestureRecognizer8)
        self.slot8Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot8Image)
        
        // Initialize Slot 9 Image (slot9Image)
        self.slot9Image = UIImageView(image: UIImage(named: "TheO"))
        self.slot9Image.isUserInteractionEnabled = true
        let tapGestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(tappedS9(_:)))
        self.slot9Image.addGestureRecognizer(tapGestureRecognizer9)
        self.slot9Image.translatesAutoresizingMaskIntoConstraints = false
        self.gridView.addSubview(slot9Image)
        
        // Initialize P2 Score Label (p2ScoreLabel)
        self.p2ScoreLabel = UILabel()
        self.p2ScoreLabel.text = "Score: \(score2)"
        self.p2ScoreLabel.font = UIFont.systemFont(ofSize: 20)
        self.p2ScoreLabel.numberOfLines = 0
        self.p2ScoreLabel.lineBreakMode = .byWordWrapping
        self.p2ScoreLabel.textAlignment = .center
        self.p2ScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(p2ScoreLabel)
        
        // Initialize P2 Name Label (p2NameLabel)
        self.p2NameLabel = UILabel()
        self.p2NameLabel.text = "Player 2: \(name2)"
        self.p2NameLabel.textColor = .black
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
        if (s1 == 0 && turn == 1 && roundsCount > 0)
            {
            s1 = 1
            turn = 2
            self.slot1Image.image = UIImage(named: "TheO")
            
            self.p1NameLabel.text = "Player 1: \(name1)"
            self.p1NameLabel.textColor = .black
            self.p1NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            self.p2NameLabel.text = "-> Player 2: \(name2)"
            self.p2NameLabel.textColor = .red
            self.p2NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            print("Player 1 changed Slot 1 to Circle!")
            checkForWinner()
            }
        else if (s1 == 0 && turn == 2 && roundsCount > 0)
            {
            s1 = 2
            turn = 1
            self.slot1Image.image = UIImage(named: "TheX")
            
            self.p1NameLabel.text = "-> Player 1: \(name1)"
            self.p1NameLabel.textColor = .blue
            self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            self.p2NameLabel.text = "Player 2: \(name2)"
            self.p2NameLabel.textColor = .black
            self.p2NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            print("Player 2 changed Slot 1 to Cross!")
            checkForWinner()
            }
        else
            {
            print("Invalid move!")
            }
        }

    @objc func tappedS2(_ sender: UIButton)
        {
        print("Slot 2 tapped!")
        if (s2 == 0 && turn == 1 && roundsCount > 0)
            {
            s2 = 1
            turn = 2
            self.slot2Image.image = UIImage(named: "TheO")
            
            self.p1NameLabel.text = "Player 1: \(name1)"
            self.p1NameLabel.textColor = .black
            self.p1NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            self.p2NameLabel.text = "-> Player 2: \(name2)"
            self.p2NameLabel.textColor = .red
            self.p2NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            print("Player 1 changed Slot 2 to Circle!")
            checkForWinner()
            }
        else if (s2 == 0 && turn == 2 && roundsCount > 0)
            {
            s2 = 2
            turn = 1
            self.slot2Image.image = UIImage(named: "TheX")
            
            self.p1NameLabel.text = "-> Player 1: \(name1)"
            self.p1NameLabel.textColor = .blue
            self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            self.p2NameLabel.text = "Player 2: \(name2)"
            self.p2NameLabel.textColor = .black
            self.p2NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            print("Player 2 changed Slot 2 to Cross!")
            checkForWinner()
            }
        else
            {
            print("Invalid move!")
            }
        }

    @objc func tappedS3(_ sender: UIButton)
        {
        print("Slot 3 tapped!")
        if (s3 == 0 && turn == 1 && roundsCount > 0)
            {
            s3 = 1
            turn = 2
            self.slot3Image.image = UIImage(named: "TheO")
            
            self.p1NameLabel.text = "Player 1: \(name1)"
            self.p1NameLabel.textColor = .black
            self.p1NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            self.p2NameLabel.text = "-> Player 2: \(name2)"
            self.p2NameLabel.textColor = .red
            self.p2NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            print("Player 1 changed Slot 3 to Circle!")
            checkForWinner()
            }
        else if (s3 == 0 && turn == 2 && roundsCount > 0)
            {
            s3 = 2
            turn = 1
            self.slot3Image.image = UIImage(named: "TheX")
            
            self.p1NameLabel.text = "-> Player 1: \(name1)"
            self.p1NameLabel.textColor = .blue
            self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            self.p2NameLabel.text = "Player 2: \(name2)"
            self.p2NameLabel.textColor = .black
            self.p2NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            print("Player 2 changed Slot 3 to Cross!")
            checkForWinner()
            }
        else
            {
            print("Invalid move!")
            }
        }

    @objc func tappedS4(_ sender: UIButton)
        {
        print("Slot 4 tapped!")
        if (s4 == 0 && turn == 1 && roundsCount > 0)
            {
            s4 = 1
            turn = 2
            self.slot4Image.image = UIImage(named: "TheO")
            
            self.p1NameLabel.text = "Player 1: \(name1)"
            self.p1NameLabel.textColor = .black
            self.p1NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            self.p2NameLabel.text = "-> Player 2: \(name2)"
            self.p2NameLabel.textColor = .red
            self.p2NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            print("Player 1 changed Slot 4 to Circle!")
            checkForWinner()
            }
        else if (s4 == 0 && turn == 2 && roundsCount > 0)
            {
            s4 = 2
            turn = 1
            self.slot4Image.image = UIImage(named: "TheX")
            
            self.p1NameLabel.text = "-> Player 1: \(name1)"
            self.p1NameLabel.textColor = .blue
            self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            self.p2NameLabel.text = "Player 2: \(name2)"
            self.p2NameLabel.textColor = .black
            self.p2NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            print("Player 2 changed Slot 4 to Cross!")
            checkForWinner()
            }
        else
            {
            print("Invalid move!")
            }
        }

    @objc func tappedS5(_ sender: UIButton)
        {
        print("Slot 5 tapped!")
        if (s5 == 0 && turn == 1 && roundsCount > 0)
            {
            s5 = 1
            turn = 2
            self.slot5Image.image = UIImage(named: "TheO")
            
            self.p1NameLabel.text = "Player 1: \(name1)"
            self.p1NameLabel.textColor = .black
            self.p1NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            self.p2NameLabel.text = "-> Player 2: \(name2)"
            self.p2NameLabel.textColor = .red
            self.p2NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            print("Player 1 changed Slot 5 to Circle!")
            checkForWinner()
            }
        else if (s5 == 0 && turn == 2 && roundsCount > 0)
            {
            s5 = 2
            turn = 1
            self.slot5Image.image = UIImage(named: "TheX")
            
            self.p1NameLabel.text = "-> Player 1: \(name1)"
            self.p1NameLabel.textColor = .blue
            self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            self.p2NameLabel.text = "Player 2: \(name2)"
            self.p2NameLabel.textColor = .black
            self.p2NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            print("Player 2 changed Slot 5 to Cross!")
            checkForWinner()
            }
        else
            {
            print("Invalid move!")
            }
        }

    @objc func tappedS6(_ sender: UIButton)
        {
        print("Slot 6 tapped!")
        if (s6 == 0 && turn == 1 && roundsCount > 0)
            {
            s6 = 1
            turn = 2
            self.slot6Image.image = UIImage(named: "TheO")
            
            self.p1NameLabel.text = "Player 1: \(name1)"
            self.p1NameLabel.textColor = .black
            self.p1NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            self.p2NameLabel.text = "-> Player 2: \(name2)"
            self.p2NameLabel.textColor = .red
            self.p2NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            print("Player 1 changed Slot 6 to Circle!")
            checkForWinner()
            }
        else if (s6 == 0 && turn == 2 && roundsCount > 0)
            {
            s6 = 2
            turn = 1
            self.slot6Image.image = UIImage(named: "TheX")
            
            self.p1NameLabel.text = "-> Player 1: \(name1)"
            self.p1NameLabel.textColor = .blue
            self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            self.p2NameLabel.text = "Player 2: \(name2)"
            self.p2NameLabel.textColor = .black
            self.p2NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            print("Player 2 changed Slot 6 to Cross!")
            checkForWinner()
            }
        else
            {
            print("Invalid move!")
            }
        }

    @objc func tappedS7(_ sender: UIButton)
        {
        print("Slot 7 tapped!")
        if (s7 == 0 && turn == 1 && roundsCount > 0)
            {
            s7 = 1
            turn = 2
            self.slot7Image.image = UIImage(named: "TheO")
            
            self.p1NameLabel.text = "Player 1: \(name1)"
            self.p1NameLabel.textColor = .black
            self.p1NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            self.p2NameLabel.text = "-> Player 2: \(name2)"
            self.p2NameLabel.textColor = .red
            self.p2NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            print("Player 1 changed Slot 7 to Circle!")
            checkForWinner()
            }
        else if (s7 == 0 && turn == 2 && roundsCount > 0)
            {
            s7 = 2
            turn = 1
            self.slot7Image.image = UIImage(named: "TheX")
            
            self.p1NameLabel.text = "-> Player 1: \(name1)"
            self.p1NameLabel.textColor = .blue
            self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            self.p2NameLabel.text = "Player 2: \(name2)"
            self.p2NameLabel.textColor = .black
            self.p2NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            print("Player 2 changed Slot 7 to Cross!")
            checkForWinner()
            }
        else
            {
            print("Invalid move!")
            }
        }

    @objc func tappedS8(_ sender: UIButton)
        {
        print("Slot 8 tapped!")
        if (s8 == 0 && turn == 1 && roundsCount > 0)
            {
            s8 = 1
            turn = 2
            self.slot8Image.image = UIImage(named: "TheO")
            
            self.p1NameLabel.text = "Player 1: \(name1)"
            self.p1NameLabel.textColor = .black
            self.p1NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            self.p2NameLabel.text = "-> Player 2: \(name2)"
            self.p2NameLabel.textColor = .red
            self.p2NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            print("Player 1 changed Slot 8 to Circle!")
            checkForWinner()
            }
        else if (s8 == 0 && turn == 2 && roundsCount > 0)
            {
            s8 = 2
            turn = 1
            self.slot8Image.image = UIImage(named: "TheX")
            
            self.p1NameLabel.text = "-> Player 1: \(name1)"
            self.p1NameLabel.textColor = .blue
            self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            self.p2NameLabel.text = "Player 2: \(name2)"
            self.p2NameLabel.textColor = .black
            self.p2NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            print("Player 2 changed Slot 8 to Cross!")
            checkForWinner()
            }
        else
            {
            print("Invalid move!")
            }
        }

    @objc func tappedS9(_ sender: UIButton)
        {
        print("Slot 9 tapped!")
        if (s9 == 0 && turn == 1 && roundsCount > 0)
            {
            s9 = 1
            turn = 2
            self.slot9Image.image = UIImage(named: "TheO")
            
            self.p1NameLabel.text = "Player 1: \(name1)"
            self.p1NameLabel.textColor = .black
            self.p1NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            self.p2NameLabel.text = "-> Player 2: \(name2)"
            self.p2NameLabel.textColor = .red
            self.p2NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            print("Player 1 changed Slot 9 to Circle!")
            checkForWinner()
            }
        else if (s9 == 0 && turn == 2 && roundsCount > 0)
            {
            s9 = 2
            turn = 1
            self.slot9Image.image = UIImage(named: "TheX")
            
            self.p1NameLabel.text = "-> Player 1: \(name1)"
            self.p1NameLabel.textColor = .blue
            self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            self.p2NameLabel.text = "Player 2: \(name2)"
            self.p2NameLabel.textColor = .black
            self.p2NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            print("Player 2 changed Slot 9 to Cross!")
            checkForWinner()
            }
        else
            {
            print("Invalid move!")
            }
        }

    // Function that checks for winner
    func checkForWinner()
        {
        print("Function called: checkForWinner()")
        var whoWonTheRound : Int = 0
        
        if (s1 >= 1 && s1 <= 2 && s1 == s2 && s2 == s3)
            {
            // Round Winning case 1 out of 8
            whoWonTheRound = s1
            }
        else if (s1 >= 1 && s1 <= 2 && s1 == s4 && s4 == s7)
            {
            // Round Winning case 2 out of 8
            whoWonTheRound = s1
            }
        else if (s1 >= 1 && s1 <= 2 && s1 == s5 && s5 == s9)
            {
            // Round Winning case 3 out of 8
            whoWonTheRound = s1
            }
        else if (s3 >= 1 && s3 <= 2 && s3 == s5 && s5 == s7)
            {
            // Round Winning case 4 out of 8
            whoWonTheRound = s3
            }
        else if (s9 >= 1 && s9 <= 2 && s9 == s8 && s8 == s7)
            {
            // Round Winning case 5 out of 8
            whoWonTheRound = s9
            }
        else if (s9 >= 1 && s9 <= 2 && s9 == s6 && s6 == s3)
            {
            // Round Winning case 6 out of 8
            whoWonTheRound = s9
            }
        else if (s5 >= 1 && s5 <= 2 && s5 == s6 && s6 == s4)
            {
            // Round Winning case 7 out of 8
            whoWonTheRound = s5
            }
        else if (s5 >= 1 && s5 <= 2 && s5 == s2 && s2 == s8)
            {
            // Round Winning case 8 out of 8
            whoWonTheRound = s5
            }
        else if (s1 > 0 && s2 > 0 && s3 > 0 && s4 > 0 && s5 > 0 && s6 > 0 && s7 > 0 && s8 > 0 && s9 > 0)
            {
            // Round ended in a draw
            whoWonTheRound = 3
            }
        else
            {
            // Round continues
            }
        
        if (whoWonTheRound == 1)
            {
            roundsCount -= 1
            score1 += 1
            
            if (roundsCount > 0)
                {
                let alert = UIAlertController(title: "Round ended.", message: "\(name1) won the round!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in self?.resetForNewRound() }))
                self.present(alert, animated: true, completion: nil)
                }
            else
                {
                gameOverAlert()
                }
            print("Player 1 '\(name1)' won the round.")
            }
        else if (whoWonTheRound == 2)
            {
            roundsCount -= 1
            score2 += 1
            
            if (roundsCount > 0)
                {
                let alert = UIAlertController(title: "Round ended.", message: "\(name2) won the round!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in self?.resetForNewRound() }))
                self.present(alert, animated: true, completion: nil)
                }
            else
                {
                gameOverAlert()
                }
            print("Player 2 '\(name2)' won the round.")
            }
        else if (whoWonTheRound == 3)
            {
            roundsCount -= 1
            
            if (roundsCount > 0)
                {
                let alert = UIAlertController(title: "Round ended.", message: "The round ended in a draw!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in self?.resetForNewRound() }))
                self.present(alert, animated: true, completion: nil)
                }
            else
                {
                gameOverAlert()
                }
            print("The round ended in a draw.")
            }
        }

    // Function to display a gave over alert
    func gameOverAlert()
        {
        print("Function called: gameOverAlert()")
        if (score1 > score2)
            {
            let alert = UIAlertController(title: "Game ended.", message: "\(name1) won the game! To play again go back to Settings.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            self.p1NameLabel.text = "Player 1: \(name1) (Winner)"
            self.p1NameLabel.textColor = .green
            self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            self.p2NameLabel.text = "Player 2: \(name2) (Loser)"
            self.p2NameLabel.textColor = .orange
            self.p2NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            print("Game ended. Player 1 '\(name1)' won the game.")
            }
        else if (score2 > score1)
            {
            let alert = UIAlertController(title: "Game ended.", message: "\(name2) won the game! To play again go back to Settings.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            self.p1NameLabel.text = "Player 1: \(name1) (Loser)"
            self.p1NameLabel.textColor = .orange
            self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            self.p2NameLabel.text = "Player 2: \(name2) (Winner)"
            self.p2NameLabel.textColor = .green
            self.p2NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            print("Game ended. Player 2 '\(name2)' won the game.")
            }
        else
            {
            let alert = UIAlertController(title: "Game ended.", message: "The game ended in a draw! To play again go back to Settings.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            self.p1NameLabel.text = "Player 1: \(name1) (Draw)"
            self.p1NameLabel.textColor = .gray
            self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            self.p2NameLabel.text = "Player 2: \(name2) (Draw)"
            self.p2NameLabel.textColor = .gray
            self.p2NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            print("The game ended in a draw.")
            }
        }

    // Function that resets the game for new round
    func resetForNewRound()
        {
        print("Function called: resetForNewRound()")
        s1 = 0
        s2 = 0
        s3 = 0
        s4 = 0
        s5 = 0
        s6 = 0
        s7 = 0
        s8 = 0
        s9 = 0
        slot1Image.image = UIImage(named: "TheBlank")
        slot2Image.image = UIImage(named: "TheBlank")
        slot3Image.image = UIImage(named: "TheBlank")
        slot4Image.image = UIImage(named: "TheBlank")
        slot5Image.image = UIImage(named: "TheBlank")
        slot6Image.image = UIImage(named: "TheBlank")
        slot7Image.image = UIImage(named: "TheBlank")
        slot8Image.image = UIImage(named: "TheBlank")
        slot9Image.image = UIImage(named: "TheBlank")
        if (whoStarted == 1)
            {
            turn = 2
            whoStarted = 2
            
            self.p1NameLabel.text = "Player 1: \(name1)"
            self.p1NameLabel.textColor = .black
            self.p1NameLabel.font = UIFont.systemFont(ofSize: 20)
            
            self.p2NameLabel.text = "-> Player 2: \(name2)"
            self.p2NameLabel.textColor = .red
            self.p2NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            }
        else if (whoStarted == 2)
            {
            turn = 1
            whoStarted = 1
            
            self.p1NameLabel.text = "-> Player 1: \(name1)"
            self.p1NameLabel.textColor = .blue
            self.p1NameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            
            self.p2NameLabel.text = "Player 2: \(name2)"
            self.p2NameLabel.textColor = .black
            self.p2NameLabel.font = UIFont.systemFont(ofSize: 20)
            }
        print("Game parameters reseted for a new round.")
        }

}
