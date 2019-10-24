//
//  CollectionTableViewCell.swift
//  Training-Adli
//
//  Created by Stella Patricia on 22/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imagePinnedImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
