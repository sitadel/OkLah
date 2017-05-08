//
//  BankSummaryCell.swift
//  ReckonING
//
//  Created by Seet on 12/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import UIKit

class BankSummaryCell: UITableViewCell {

    let gradientLayer = CAGradientLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
        //Style.setupCellGradient(view: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
