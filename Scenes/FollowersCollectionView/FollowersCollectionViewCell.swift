//
//  FollowersCollectionViewCell.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/7/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//

import UIKit
import SDWebImage

class FollowersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var followersImageView: UIImageView!
    @IBOutlet weak var followerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     }
    
    func configure(withFollowers follower: Followers) {
        if let urlString = follower.avatarUrl, let url = URL(string: urlString) {
            followersImageView.sd_setImage(with: url, completed: nil)
        }
        followerName.text = follower.login

    }

}
