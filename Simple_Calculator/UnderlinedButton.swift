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
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.1)
        
        self.setTitleColor(UIColor.white, for: .normal)
        self.addBorder(side: .Bottom, color: borderColor, borderwidth: 1)
        
    }
    
}
