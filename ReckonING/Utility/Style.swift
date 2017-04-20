//
//  Style.swift
//  ReckonING
//
//  Created by Seet on 20/4/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import Foundation
import UIKit

class Style
{
    class func setupTableGradient(view:UIView)
    {
        let gradientLayer = CAGradientLayer()

        // 1
        //self.view.backgroundColor = UIColor.white

        // 2
        gradientLayer.frame = view.bounds
        
        // 3
        let color1 = UIColor.uicolorFromHex(0xFF3333, alpha:1.0).cgColor
        let color2 = UIColor.uicolorFromHex(0xFF3333, alpha:1.0).cgColor
        let color3 = UIColor.uicolorFromHex(0xFF6633, alpha:1.0).cgColor
        //            UIColor.yellow.cgColor as CGColor
        let color4 = UIColor.uicolorFromHex(0xFF6633, alpha:1.0).cgColor
        //let color3 = UIColor.clear.cgColor as CGColor
        //        let color4 = UIColor(white: 0.0, alpha: 0.1).cgColor as CGColor
        gradientLayer.colors = [color1, color2, color3, color4]
        
        // 4
        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        
        // 5
        //self.view.layer.addSublayer(gradientLayer)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
