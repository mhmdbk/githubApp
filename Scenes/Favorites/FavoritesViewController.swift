//
//  FavoritesViewController.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/7/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoritesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        
        
        let  FavoriteTableViewCellNib = UINib(nibName: "FavoritesTableViewCell", bundle: .main)
        favoritesTableView.register(FavoriteTableViewCellNib, forCellReuseIdentifier: "FavoritesTableViewCell")
        
        favoritesTableView.rowHeight = UITableView.automaticDimension
        favoritesTableView.estimatedRowHeight = 80
        
    }
    
}

extension FavoritesViewController: UITableViewDelegate {
    
}
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
                   return cell
    }
    
    
}
