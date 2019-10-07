//
//  DashboardImageTableViewCell.swift
//  Training-Adli
//
//  Created by Stella Patricia on 03/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

protocol dashboardCellImageDelegate : class  {
    func _didLike (id:String)
}

class DashboardImageTableViewCell: UITableViewCell {

    struct dashboardImageCellDS {
        var id : String?
        var isLikedByUser : Int?
    }
    
    @IBOutlet weak var imageDownload: UIImageView! {
        didSet {
            let image = UIImage.init(named: "ic_arrow_download")
            let _image = image?.withRenderingMode(.alwaysTemplate) ?? UIImage()
            imageDownload.image = _image
        }
    }
    @IBOutlet weak var imageLove: UIImageView! {
        didSet {
            let image = UIImage.init(named: "ic_love_black")
            let _image = image?.withRenderingMode(.alwaysTemplate) ?? UIImage()
            imageLove.image = _image
        }
    }
    @IBOutlet weak var imageCollections: UIImageView!{
        didSet {
            let image = UIImage.init(named: "ic_plus")
            let _image = image?.withRenderingMode(.alwaysTemplate) ?? UIImage()
            imageCollections.image = _image
        }
    }
    @IBOutlet weak var imageProfileCell: UIImageView! {
        didSet {
            imageProfileCell.circleRadius(withBorder: true)
        }
    }
    @IBOutlet weak var loveHitboxes: UIView! {
        didSet {
            loveHitboxes.setShadow()
            loveHitboxes.constantRadius(withBorder: true)
            loveHitboxes.isUserInteractionEnabled = true
            loveHitboxes.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(likeAction(_:))))
        }
    }
    @IBOutlet weak var downloadHitboxes: UIView! {
        didSet {
            downloadHitboxes.constantRadius(withBorder: true)
            downloadHitboxes.setShadow()
        }
    }
    @IBOutlet weak var AddCollectionHitboxes: UIView! {
        didSet {
            AddCollectionHitboxes.constantRadius(withBorder: true)
            AddCollectionHitboxes.setShadow()
            AddCollectionHitboxes.isUserInteractionEnabled = true
            AddCollectionHitboxes.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(addCollectionAction(_:))))
        }
    }
    @IBOutlet weak var loveImage: UIImageView! {
        didSet {
            let image = UIImage.init(named: "ic_love") ?? UIImage()
            let imageRendering = image.withRenderingMode(.alwaysTemplate)
            loveImage.image = imageRendering
        }
    }
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    weak var idDelegate : dashboardCellImageDelegate?
    var datastore : dashboardImageCellDS = dashboardImageCellDS()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loveImage.alpha = 0
        loveImage.transform = CGAffineTransform.init(scaleX: 0, y: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @objc func likeAction(_ sender:Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.25, options: .curveEaseInOut, animations: {
            self.loveImage.alpha = 1
            self.loveImage.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        }) { (isDone) in
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (timer) in
                UIView.animate(withDuration: 0.25, animations: {
                    self.loveImage.transform = CGAffineTransform.init(scaleX: 0.0001, y: 0.0001)
                    self.loveImage.alpha = 0
                })
            })
            
            if isDone {
                "Is Liked ?".createMessage(message: self.datastore.isLikedByUser!)
//                self.idDelegate?._didLike(id: self.datastore.id ?? "Unkown")
            }
        }
        
    }
    
    @objc func addCollectionAction (_ sender:Any) {
        
    }
    
    func likedByUser () {
        imageLove.alpha = 1
    }
    func unlikedByUser () {
        imageLove.alpha = 0.5
    }
    
}
