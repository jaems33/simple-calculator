//
//  UnderlinedButton.swift
//  Simple_Calculator
//
//  Created by James Teow on 10/6/16.
//  Copyright © 2016 James Teow. All rights reserved.
//

import Foundation
import UIKit

public class UnderlinedButton: UIButton {
    
    let borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.1)
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.setTitleColor(UIColor.white, for: .normal)
        self.addBorder(side: .Bottom, color: borderColor, borderwidth: 1)
        
    }
    
    // When the button gets re-sized, make sure to re-size the bottom border too
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.resizeBorder()
    }
    
}
