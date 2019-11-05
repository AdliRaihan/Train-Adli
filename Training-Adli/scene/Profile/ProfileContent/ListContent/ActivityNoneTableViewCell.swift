//
//  ActivityNoneTableViewCell.swift
//  Training-Adli
//
//  Created by Stella Patricia on 31/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class ActivityNoneTableViewCell: UITableViewCell {
    
    @IBOutlet weak var _imageIdentfier: UIImageView!
    @IBOutlet weak var _imageIdentfierViewHolder : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupImageIdentifier()
        setupImageHolder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupImageIdentifier() {
        let image = UIImage.init(named: "ic_camera")?.withRenderingMode(.alwaysTemplate)
        _imageIdentfier.image = image ?? UIImage()
        _imageIdentfier.tintColor =  UIColor.darkGray
    }
    
    private func setupImageHolder () {
        
    }
    
}
