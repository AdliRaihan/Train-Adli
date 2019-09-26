//
//  ExploreTableViewCell.swift
//  Training-Adli
//
//  Created by Stella Patricia on 16/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {

    @IBOutlet weak var itemViewHolder: UIView!
    @IBOutlet weak var rarityItems: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupRarity()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupRarity () {
        self.rarityItems.setShadow(withColor: self.rarityItems.backgroundColor!,Opacity: 1)
        self.rarityItems.circleRadius()
        self.itemViewHolder.constantRadius()
        self.itemViewHolder.setShadow(Opacity: 0.1)
    }

}
