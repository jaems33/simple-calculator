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
    
    fileprivate let borderColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.1)
    fileprivate let borderColorHighlight = UIColor.white
    public var label = UILabel()
    fileprivate var firstTimeLoaded = false
    fileprivate var desiredText = String()
    fileprivate var fontSize = CGFloat()
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.contentScaleFactor = 9.0
        self.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.0), for: .normal)
        self.addBorder(side: .Bottom, color: borderColor, borderwidth: 1)
        
        desiredText = self.currentTitle!
        fontSize = self.titleLabel!.font.pointSize
      
    }
    
    override public func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let position = CGPoint(x: 0, y: 0)
        let size = CGSize(width: self.bounds.size.width, height: self.bounds.size.height)
        let contentRectRefined = CGRect(origin: position, size: size)
        return super.titleRect(forContentRect: contentRectRefined)
    }
        
    // When the button gets re-sized, make sure to re-size the bottom border too
    override public func layoutSubviews() {
        super.layoutSubviews()
        if firstTimeLoaded == false {
            self.resizeBorder()
            createLabel()
            firstTimeLoaded = true
        }

    }
    
    public func createLabel(){
        var ascenderAdjustment = CGFloat(0)
        var fontName = "DIN-Regular"
        if (fontSize != 24.0){
            fontName = "DIN-Light"
            ascenderAdjustment = CGFloat(5)
        }
        label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height - ascenderAdjustment))
        label.font = UIFont(name: fontName, size: fontSize)
        label.textAlignment = NSTextAlignment.center
        label.baselineAdjustment = UIBaselineAdjustment(rawValue: 5)!
        label.text = desiredText
        label.textColor = UIColor.white
        self.addSubview(label)
    }
    
    public func touchState(){
        label.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
        self.highlightBorder(color: borderColorHighlight)
    }
    
    public func touchOffState(){
        UIView.animate(withDuration: 0.1, animations: {
            self.label.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        self.borderReturnToNormal(color: borderColor)
    }
    
}
