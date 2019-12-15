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
    
    // Number of cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (finishLoading) ? 1 : 0
    }
    
    // Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return initialCell(row: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return determineRowHeight(row: indexPath.row)
    }
    
    // Determine Row Heights
    private func determineRowHeight ( row : Int ) -> CGFloat {
        if ( isCollectionZero )  { return 255.5}
        switch row {
        case 0:
            return 260
            
        default: return 0.0
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
    
    
    // Cell class function
    func _initialCell (row : Int) -> UITableViewCell {
        "Collection Zero Is".createMessage(message: isCollectionZero)
        if isCollectionZero {
            return __intialCell(nib: "ActivityNoneTableViewCell", identifier: "noneActivity")
        }
        
        switch row {
        case 0:
            return __intialCell(nib: "CollectionTableViewCell", identifier: "collectionUser")
        default : return UITableViewCell()
        }
    }
    
    // Initialize Cell __
    private func  __intialCell(nib : String , identifier : String) -> UITableViewCell {
        let _nib = UINib.init(nibName: nib, bundle: nil)
        registerCell(nib: _nib, identifier: identifier)
        return tableViewProfileContent.dequeueReusableCell(withIdentifier: identifier)!
    }
    
    
    // For editing inside the object
    class func dataStoreCell (cell : UITableViewCell) -> UITableViewCell {
        
        func collectionCell () -> UITableViewCell {
            if let _cell = cell as? CollectionTableViewCell {
                return(_cell)
            }
            return cell
        }
        
        switch cell {
        case cell as? ActivityNoneTableViewCell :
            "Activity Table ".createMessage(message: "Initialized!")
            return cell
        case cell as? CollectionTableViewCell :
            "Collection Cell".createMessage(message: "Its Initialized!")
            return collectionCell()
        default:
            return UITableViewCell()
        }
        
    }
    
}
