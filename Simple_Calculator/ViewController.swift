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
    @IBOutlet weak var groupedButtons: UIStackView!
    
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
    
    override func viewDidAppear(_ animated: Bool) {

        // Re-position the display and clear button based on the digit and operations buttons
        let newYPosition = (groupedButtons.frame.origin.y / 2) - (displayButton.frame.height / 2)
        displayButton.frame.origin.y = newYPosition
        displayButton.frame.origin.x = 20
        
        let clearYPosition = displayButton.frame.origin.y + (displayButton.frame.height / 2) - (clear.frame.height / 2)
        clear.frame.origin.y = clearYPosition
    }
    
    @IBAction func copyValue(_ sender: UIButton) {
        UIPasteboard.general.string = sender.currentTitle!
    }
    
    @IBAction func clearDisplay(_ sender: UIButton) {
        brain.clear()
        displayButton.setTitle("0", for: .normal)
        userIsInTheMiddleOfTyping = false
    }
    
    @IBAction fileprivate func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping == false {
            updateDisplayWithoutAnimation(digit)
        }
        else {
            updateDisplayWithoutAnimation(displayButton.currentTitle! + digit)
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
            brain.setPartialResult(true)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        updateDisplayWithoutAnimation(String(brain.result))
    }
    
    
    @IBAction func touchDecimal(_ sender: UIButton) {
        
        if userIsInTheMiddleOfTyping == false {
            updateDisplayWithoutAnimation("0")
            userIsInTheMiddleOfTyping = true
        }
        print("Decimal check:")
        print(displayButton.currentTitle!.range(of: "."))
        
        if (displayButton.currentTitle!.range(of: ".")) == nil {
            updateDisplayWithoutAnimation(displayButton.currentTitle! + ".")
        }
        
    }
    
    // Adding sample comment
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateDisplayWithoutAnimation(_ result:String){
        UIView.performWithoutAnimation {
            displayButton.setTitle(result, for: .normal)
            displayButton.layoutIfNeeded()
        }
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
