//
//  BankSummaryCell.swift
//  ReckonING
//
//  Created by Seet on 20/4/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import UIKit

class BankSummaryCell: UITableViewCell {

    let gradientLayer = CAGradientLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupGradient()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Gradient background
    
    func setupGradient()
    {
        // 1
        //self.view.backgroundColor = UIColor.blue
        
        // 2
        gradientLayer.frame = self.bounds
        
        // 3
        //let gradientDark = UIColor.blue
        //let gradientLight = UIColor.white
        let gradientDark = UIColor.uicolorFromHex(0xFF3333, alpha:1.0)
        let gradientLight = UIColor.uicolorFromHex(0xFF9933, alpha:1.0)
        
        let color1 = gradientLight.cgColor as CGColor
        let color2 = gradientDark.cgColor as CGColor
        let color3 = gradientDark.cgColor as CGColor
        let color4 = gradientLight.cgColor as CGColor
        gradientLayer.colors = [color1, color2, color3, color4]
        
        // 4
        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        
        // 5
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
