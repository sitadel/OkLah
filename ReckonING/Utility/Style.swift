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
    static let darkOrange = 0xFF2900 as UInt32
    static let lightOrange = 0xFF9500 as UInt32
    
    static let navigationBarTintColor = UIColor.white
    static let navigationBarTitleTextColor = UIColor.white
    
    class func setupTableGradient(view:UIView)
    {
        let gradientLayer = CAGradientLayer()

        // 1
        //self.view.backgroundColor = UIColor.white

        // 2
        gradientLayer.frame = view.bounds
        
        // 3
        /*
        let color1 = UIColor.uicolorFromHex(Style.darkOrange, alpha:1.0).cgColor
        let color2 = UIColor.uicolorFromHex(Style.darkOrange, alpha:1.0).cgColor
        let color3 = UIColor.uicolorFromHex(Style.lightOrange, alpha:1.0).cgColor
        let color4 = UIColor.uicolorFromHex(Style.lightOrange, alpha:1.0).cgColor
        gradientLayer.colors = [color1, color2, color3, color4]
        */
        let color1 = UIColor.uicolorFromHex(Style.darkOrange, alpha:1.0).cgColor
        let color2 = UIColor.uicolorFromHex(Style.lightOrange, alpha:1.0).cgColor
        gradientLayer.colors = [color1, color2]
        
        // 4
        //gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        gradientLayer.locations = [0.0, 1.0]
        
        // 5
        //self.view.layer.addSublayer(gradientLayer)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    class func setupCellGradient(view:UIView)
    {
        let gradientLayer = CAGradientLayer()

        // 1
        //self.view.backgroundColor = UIColor.blue
        
        // 2
        gradientLayer.frame = view.bounds
        
        // 3
        //let gradientDark = UIColor.blue
        //let gradientLight = UIColor.white
        let gradientDark = UIColor.uicolorFromHex(darkOrange, alpha:1.0)
        let gradientLight = UIColor.uicolorFromHex(lightOrange, alpha:1.0)
        
        let color1 = gradientLight.cgColor as CGColor
        let color2 = gradientDark.cgColor as CGColor
        let color3 = gradientDark.cgColor as CGColor
        let color4 = gradientLight.cgColor as CGColor
        gradientLayer.colors = [color1, color2, color3, color4]
        
        // 4
        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        
        // 5
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
