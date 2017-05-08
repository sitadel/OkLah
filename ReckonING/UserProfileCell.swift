//
//  UserProfileCell.swift
//  ReckonING
//
//  Created by Seet on 12/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import UIKit

class UserProfileCell: UITableViewCell {

    @IBOutlet var userPhotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let userPhotoSize = userPhotoImageView.bounds.size.height
        let cornerRadius =  userPhotoSize / 2
        
        // make user profile photo circular in shape
        userPhotoImageView.layer.cornerRadius = cornerRadius
        userPhotoImageView.clipsToBounds = true;
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
