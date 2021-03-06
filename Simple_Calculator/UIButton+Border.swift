//
//  UIButton+Border.swift
//  Simple_Calculator
//
//  Created by James Teow on 10/5/16.
//  Copyright © 2016 James Teow. All rights reserved.
//

import Foundation
import UIKit

public enum UIButtonBorderSide {
    case Bottom
}

extension UIButton {
    
    public func addBorder(side: UIButtonBorderSide, color: UIColor, borderwidth: CGFloat){
        
        let border = CALayer()
        border.backgroundColor = color.cgColor
                
        switch side {
            case .Bottom:
            border.frame = CGRect(x:0, y: self.frame.size.height - borderwidth, width: self.frame.size.width, height: borderwidth)
        }
        
        self.layer.addSublayer(border)
        
    }
    
    public func resizeBorder(){
        self.layer.sublayers!.first!.frame = CGRect(x:0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
    }
    
    public func highlightBorder(color: UIColor){
        self.layer.sublayers!.first!.backgroundColor = color.cgColor
    }
    
    public func borderReturnToNormal(color: UIColor){
        UIView.animate(withDuration: 0.1, animations: {
            self.layer.sublayers!.first!.backgroundColor = color.cgColor
        }, completion: nil)
    }
    
}

