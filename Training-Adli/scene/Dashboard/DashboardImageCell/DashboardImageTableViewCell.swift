//
//  DashboardImageTableViewCell.swift
//  Training-Adli
//
//  Created by Stella Patricia on 03/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class DashboardImageTableViewCell: UITableViewCell {

    @IBOutlet weak var imageProfileCell: UIImageView! {
        didSet {
            imageProfileCell.circleRadius()
        }
    }
    @IBOutlet weak var imageCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
