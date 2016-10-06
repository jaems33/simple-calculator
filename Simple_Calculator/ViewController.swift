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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createGradientLayer()
    }
    
    @IBAction fileprivate func touchDigit(_ sender: UIButton) {
        print("Hello!")
    }
    
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

    @IBAction func PanView(sender: UIScreenEdgePanGestureRecognizer) {
        let top = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let bottom = UIColor(red: 93.0/255.0, green: 192.0/255.0, blue: 235.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [top, bottom]
    }
}
