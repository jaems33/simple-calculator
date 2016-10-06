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
        
        self.setTitleColor(UIColor.white, for: .normal)
        self.addBorder(side: .Bottom, color: .white, borderwidth: 1)
        
    }
    
}
