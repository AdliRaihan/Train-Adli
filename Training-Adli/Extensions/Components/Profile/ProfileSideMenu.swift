//
//  ProfileSideMenu.swift
//  Training-Adli
//
//  Created by Stella Patricia on 24/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
protocol profileSideMenuDelegate {
    func _closeMenu()
}
class ProfileSideMenu: UIView {
    
    
    // Variable Identifier Name Menu
    var menu : [String] = ["Profile","Settings","Logout","About"]
    let thisMenu = "Profile"
    
    // Creating Table View
    var tableView : UITableView?
    
    // Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        // To Do Something
    }
    
    // Required Init if init is has to be do Be to has to be
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Awake From Nib
    override func awakeFromNib () {
        super.awakeFromNib()
        self.setupUI()
        self.setupAppareances()
    }
    
    // Test
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        return super.awakeAfter(using: aDecoder)
    }
    
    // Fix Uncorrectly width 
    override func layoutSubviews() {
        if let _tableView = tableView {
            var _bounds = bounds
            _bounds.origin.y += 75
            _tableView.frame = _bounds
        }
    }
    
    // Methods
    private func setupUI () {
        tableView = UITableView.init(frame: self.bounds)
        tableView!.delegate = self
        tableView!.dataSource = self
    }
    
    // Methods
    private func setupAppareances () {
        guard tableView != nil else { return }
        tableView!.separatorStyle = .none
        self.addSubview(tableView!)
        self.setShadow()
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
     */
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 0, y: +75))
        path.addLine(to: CGPoint.init(x: UIScreen.main.bounds.width, y: +75))
        
        // add color
        UIColor.darkGray.withAlphaComponent(0.5).setStroke()
        path.stroke()
        self.setNeedsLayout()
    }

}


extension ProfileSideMenu : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellInitializer(row: indexPath.row)
    }
    
    
    // Return height of its cell foreach cell also cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    // Initializer Cell
    private func cellInitializer (row : Int) -> UITableViewCell {
        let nib = UINib.init(nibName: "ProfileSideMenuContentViewCell", bundle: nil)
        tableView!.register(nib, forCellReuseIdentifier: "profileContentPoints")
        let cell = tableView!.dequeueReusableCell(withIdentifier: "profileContentPoints") as? ProfileSideMenuPointsTableViewCell
        
        if let _cell = cell {
            _cell.identifierMenu.text = menu[row]
            if thisMenu == menu[row] {
                _cell.identifierMenu.textColor = UIColor.black.withAlphaComponent(0.75)
            }
        }
        
        return cell ?? UITableViewCell()
    }
    
}
