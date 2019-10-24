//
//  tableViewProfileContent.swift
//  Training-Adli
//
//  Created by Stella Patricia on 22/10/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class tableViewProfileContent: UITableView {

    
    // initial Init
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    // Code Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Initialize Datasource & delegate
    func initializeData ( parent : ProfileViewController ) {
        parent.tableViewProfileContent.delegate = parent
        parent.tableViewProfileContent.dataSource = parent
    }
    
    // awakefromnib
    override func awakeFromNib() {
        super.awakeFromNib()
        self.separatorStyle = .none
    }

}

extension ProfileViewController : UITableViewDelegate , UITableViewDataSource {
    
    
    // For editing inside the object
    class func dataStoreCell (cell : UITableViewCell) -> UITableViewCell {
        
        func collectionCell () -> UITableViewCell {
            if let _cell = cell as? CollectionTableViewCell {
                return(_cell)
            }
            return cell
        }
        
        switch cell {
        case cell as? CollectionTableViewCell :
            "Collection Cell".createMessage(message: "Its Initialized!")
            return collectionCell()
        default:
            return UITableViewCell()
        }
        
    }
    
    // Number of cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return initialCell(row: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    // Cell class function
    
    func _initialCell (row : Int) -> UITableViewCell {
        switch row {
        case 0:
            let nib = UINib.init(nibName: "CollectionTableViewCell", bundle: nil)
            registerCell(nib: nib, identifier: "collectionUser")
            return tableViewProfileContent.dequeueReusableCell(withIdentifier: "collectionUser")!
        default : return UITableViewCell()
        }
    }
    
    // register
    private func registerCell (nib : UINib,identifier : String) {
        self.tableViewProfileContent.register(nib, forCellReuseIdentifier: identifier)
    }
    
    // initialize Cell and return to cell
    private func initialCell (row : Int) -> UITableViewCell {
        return ProfileViewController.dataStoreCell(  cell: _initialCell(row: row)  )
    }
    
    
    
}
