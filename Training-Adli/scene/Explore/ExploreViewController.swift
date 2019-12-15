//
//  ExploreViewController.swift
//  Training-Adli
//
//  Created by Adli Raihan on 16/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class ExploreViewController: BaseViewController {

    @IBOutlet weak var exploreTableView: UITableView!
    @IBOutlet weak var exploreDetailView: UIView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTitle(Title: "Explore")
        exploreTableView.delegate = self
        exploreTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension ExploreViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nib = UINib.init(nibName: "ExploreTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "exploreItems")
        return tableView.dequeueReusableCell(withIdentifier: "exploreItems")!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
}
