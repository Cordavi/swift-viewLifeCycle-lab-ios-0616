//
//  ViewController.swift
//  FunWithViews
//
//  Created by James Campagno on 6/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceViewOne: UIView!
    @IBOutlet weak var diceViewTwo: UIView!
    @IBOutlet weak var diceViewThree: UIView!
    @IBOutlet weak var diceViewFour: UIView!
    @IBOutlet weak var diceViewFive: UIView!
    @IBOutlet weak var diceViewSix: UIView!
    @IBOutlet weak var diceViewSeven: UIView!
    
    @IBOutlet weak var diceRollTapped: UIButton!
    @IBOutlet weak var firstRollLabel: UILabel!
    @IBOutlet weak var secondRollLabel: UILabel!
    @IBOutlet weak var thirdRollLabel: UILabel!
    @IBOutlet weak var fourthRollLabel: UILabel!
    @IBOutlet weak var fifthRollLabel: UILabel!
    @IBOutlet weak var sixthRollLabel: UILabel!
    
    var outletCollection: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstRollLabel.hidden = true
        secondRollLabel.hidden = true
        thirdRollLabel.hidden = true
        fourthRollLabel.hidden = true
        fifthRollLabel.hidden = true
        sixthRollLabel.hidden = true
        outletCollection = [firstRollLabel, secondRollLabel, thirdRollLabel, fourthRollLabel, fifthRollLabel, sixthRollLabel]
        
        resetDiceViews()
    }
    
    // Returns back a random Int (1, 2, 3, 4, 5, or 6)
    func randomDiceRoll() -> Int {
        return Int(arc4random_uniform(6) + 1)
    }
    
    @IBAction func diceRollTapped(sender: AnyObject) {
        resetDiceViews()
        let diceRoll = randomDiceRoll()
        showDiceRoll(diceRoll)
        setRollLabels(diceRoll)
        
    }
    
    func setRollLabels(number: Int) {
        let label = outletCollection.filter{$0.text?.isEmpty ?? false}.first
        label?.text = "\(number)"
        label?.hidden = false
    }
    
    func resetDiceViews() {
        diceViewOne.hidden = true
        diceViewTwo.hidden = true
        diceViewThree.hidden = true
        diceViewFour.hidden = true
        diceViewFive.hidden = true
        diceViewSix.hidden = true
        diceViewSeven.hidden = true
    }
    
    func showDiceRoll(number: Int) {
        switch number {
        case 1:
            diceViewFour.hidden = false
        case 2:
            diceViewOne.hidden = false
            diceViewSeven.hidden = false
        case 3:
            diceViewOne.hidden = false
            diceViewFour.hidden = false
            diceViewSeven.hidden = false
        case 4:
            diceViewOne.hidden = false
            diceViewThree.hidden = false
            diceViewFive.hidden = false
            diceViewSeven.hidden = false
        case 5:
            diceViewOne.hidden = false
            diceViewThree.hidden = false
            diceViewFour.hidden = false
            diceViewFive.hidden = false
            diceViewSeven.hidden = false
        case 6:
            diceViewOne.hidden = false
            diceViewTwo.hidden = false
            diceViewThree.hidden = false
            diceViewFive.hidden = false
            diceViewSix.hidden = false
            diceViewSeven.hidden = false
        default:
            print("Roll is now valid")
        }
    }
}
