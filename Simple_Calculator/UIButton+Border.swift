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
    
}

