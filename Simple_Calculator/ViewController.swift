//
//  ViewController.swift
//  Simple_Calculator
//
//  Created by James Teow on 10/4/16.
//  Copyright © 2016 James Teow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var displayButton: UIButton!
    @IBOutlet weak var clear: UIButton!
    
    fileprivate var userIsInTheMiddleOfTyping = false
    
    fileprivate var brain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createGradientLayer()
        
        displayButton.setTitleColor(UIColor.white, for: .normal)
        clear.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.2), for: .normal)
        displayButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
    }
    
    @IBAction func clearDisplay(_ sender: UIButton) {
        displayButton.setTitle("0", for: .normal)
        userIsInTheMiddleOfTyping = false
    }
    
    @IBAction fileprivate func touchDigit(_ sender: UIButton) {

        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping == false {
            // Necessary to prevent button from constantly re-animating upon title change
            UIView.performWithoutAnimation {
                displayButton.setTitle(digit, for: .normal)
                displayButton.layoutIfNeeded()
            }
        }
        else {
            UIView.performWithoutAnimation {
                displayButton.setTitle(digit + displayButton.currentTitle!, for: .normal)
                displayButton.layoutIfNeeded()
            }
        }

        userIsInTheMiddleOfTyping = true

    }
    
    var displayValue: Double {
        get {
            return Double(displayButton.currentTitle!)!
        }
        set {
            displayButton.setTitle(String(newValue), for: .normal)
        }
    }
    
    @IBAction func touchOperator(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        UIView.performWithoutAnimation {
            displayButton.setTitle(String(brain.result), for: .normal)
            displayButton.layoutIfNeeded()
        }
    }
    
    
    @IBAction func touchDecimal(_ sender: UIButton) {
    }
    
    // Adding sample comment
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        let top = UIColor(red: 60.0/255.0, green: 75.0/255.0, blue: 148.0/255.0, alpha: 1.0).cgColor
        let bottom = UIColor(red: 93.0/255.0, green: 192.0/255.0, blue: 235.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [top, bottom]
        self.view.layer.addSublayer(gradientLayer)
        gradientLayer.zPosition = -1
    }

}
