//
//  SVGViewController.swift
//  Training-Adli
//
//  Created by Adli Raihan on 01/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class SVGViewController: UIViewController {

    @IBOutlet weak var bodyImage: UIImageView! {
        didSet {
//            bodyImage.kf.setImage(with: URL.init(string: Defaults[.appDefaultImageHeader]))
        }
    }
    
    
    // Lsts Of Outlets
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    

}
