//
//  TransactionTableViewCell.swift
//  ReckonING
//
//  Created by Seet on 12/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var transactionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
