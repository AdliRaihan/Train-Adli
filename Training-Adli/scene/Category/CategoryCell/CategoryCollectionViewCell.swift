//
//  CategoryCollectionViewCell.swift
//  Training-Adli
//
//  Created by Stella Patricia on 09/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var OutterShadowLayer: UIView!
    @IBOutlet weak var imageHolder: UIImageView!
    @IBOutlet weak var labelViewHolder: UIView!
    @IBOutlet weak var labelNameCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setLabelViewHolder()
        setupView()
    }

    private func setLabelViewHolder () {
        let gradient = UIColor().gradientAtDashboard()
        gradient?.frame = UIScreen.main.bounds
        labelViewHolder.layer.addSublayer(gradient ?? CAGradientLayer())
        labelViewHolder.clipsToBounds = true
    }
    
    private func setupView () {
        OutterShadowLayer.setShadow()
//        imageHolder.kf.setImage(with: URL.init(string: Defaults[.appDefaultImageHeader]))
    }
}
