//
//  FavoritesTableViewCell.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/7/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var favoriteNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    
}
